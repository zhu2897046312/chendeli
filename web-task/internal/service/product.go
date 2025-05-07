package service

import (
	"errors"
	"fmt"
	"context"
	"time"
	"encoding/json"
	"web-task/internal/models"

	"github.com/go-redis/redis/v8"
)

type ProductService struct {
	*Service
	redisClient *redis.Client
}

func NewProductService(base *Service, redisClient *redis.Client) *ProductService {
	return &ProductService{
		Service:     base,
		redisClient: redisClient,
	}
}

// 缓存键生成函数
func (s *ProductService) productCacheKey(id uint) string {
	return fmt.Sprintf("product:%d", id)
}

func (s *ProductService) productsListCacheKey(params map[string]interface{}) string {
	key := "products:list"
	for k, v := range params {
		key += fmt.Sprintf(":%s=%v", k, v)
	}
	return key
}

func (s *ProductService) clearListCaches() {
	// 使用通配符删除所有产品列表缓存
	keys, err := s.redisClient.Keys(context.Background(), "products:list*").Result()
	if err == nil {
		for _, key := range keys {
			s.redisClient.Del(context.Background(), key)
		}
	}
}

func (s *ProductService) GetProduct(id uint) (*models.Product, error) {
	cacheKey := s.productCacheKey(id)
	
	// 尝试从缓存获取
	cachedProduct, err := s.redisClient.Get(context.Background(), cacheKey).Result()
	if err == nil {
		var product models.Product
		if err := json.Unmarshal([]byte(cachedProduct), &product); err == nil {
			return &product, nil
		}
	}

	// 缓存未命中，从数据库获取
	product, err := s.repoFactory.GetProductRepository().GetByID(id)
	if err != nil {
		return nil, err
	}

	// 存入缓存
	productJSON, err := json.Marshal(product)
	if err == nil {
		s.redisClient.Set(context.Background(), cacheKey, productJSON, 24*time.Hour)
	}

	return product, nil
}

func (s *ProductService) ListProducts(page, pageSize int) ([]models.Product, int64, error) {
	cacheKey := s.productsListCacheKey(map[string]interface{}{
		"page":     page,
		"pageSize": pageSize,
	})

	// 尝试从缓存获取
	cachedData, err := s.redisClient.Get(context.Background(), cacheKey).Result()
	if err == nil {
		var result struct {
			Products []models.Product
			Total    int64
		}
		if err := json.Unmarshal([]byte(cachedData), &result); err == nil {
			return result.Products, result.Total, nil
		}
	}

	// 缓存未命中，从数据库获取
	products, total, err := s.repoFactory.GetProductRepository().List(page, pageSize)
	if err != nil {
		return nil, 0, err
	}

	// 存入缓存
	data := struct {
		Products []models.Product
		Total    int64
	}{products, total}
	dataJSON, err := json.Marshal(data)
	if err == nil {
		s.redisClient.Set(context.Background(), cacheKey, dataJSON, 1*time.Hour)
	}

	return products, total, nil
}

func (s *ProductService) CreateProduct(product *models.Product) error {
	if product.Name == "" {
		return errors.New("product name is required")
	}
	if product.Price.IsZero() {
		return errors.New("product price is required")
	}
	if product.Stock < 0 {
		return errors.New("product stock cannot be negative")
	}

	if product.Status != "" && product.Status != "active" && product.Status != "inactive" {
		product.Status = "active"
	}

	if product.Images == nil {
		product.Images = make([]string, 0)
	}
	if product.Tags == nil {
		product.Tags = make([]string, 0)
	}

	if err := s.repoFactory.GetProductRepository().Create(product); err != nil {
		return err
	}

	// 清除相关列表缓存
	s.clearListCaches()
	return nil
}

func (s *ProductService) UpdateProduct(product *models.Product) error {
	if _, err := s.GetProduct(product.ID); err != nil {
		return errors.New("product not found")
	}

	if product.Status != "" && product.Status != "active" && product.Status != "inactive" {
		return errors.New("invalid status value")
	}

	if err := s.repoFactory.GetProductRepository().Update(product); err != nil {
		return err
	}

	// 更新缓存
	cacheKey := s.productCacheKey(product.ID)
	productJSON, err := json.Marshal(product)
	if err == nil {
		s.redisClient.Set(context.Background(), cacheKey, productJSON, 24*time.Hour)
	}

	// 清除相关列表缓存
	s.clearListCaches()
	return nil
}

func (s *ProductService) DeleteProduct(id uint) error {
	if _, err := s.GetProduct(id); err != nil {
		return errors.New("product not found")
	}

	if err := s.repoFactory.GetProductRepository().Delete(id); err != nil {
		return err
	}

	// 清除缓存
	s.redisClient.Del(context.Background(), s.productCacheKey(id))
	
	// 清除相关列表缓存
	s.clearListCaches()
	return nil
}

func (s *ProductService) ListProductsByCategory(category string, page, pageSize int) ([]models.Product, int64, error) {
	return s.repoFactory.GetProductRepository().ListByCategory(category, page, pageSize)
}

func (s *ProductService) ListProductsByPriceRange(minPrice, maxPrice float64, page, pageSize int) ([]models.Product, int64, error) {
	if minPrice > maxPrice {
		return nil, 0, errors.New("invalid price range")
	}
	return s.repoFactory.GetProductRepository().ListByPriceRange(minPrice, maxPrice, page, pageSize)
}

func (s *ProductService) ListProductsByTags(tags []string, page, pageSize int) ([]models.Product, int64, error) {
	if len(tags) == 0 {
		return nil, 0, errors.New("tags cannot be empty")
	}
	return s.repoFactory.GetProductRepository().ListByTags(tags, page, pageSize)
}

func (s *ProductService) SearchProducts(keyword string, page, pageSize int) ([]models.Product, int64, error) {
	if keyword == "" {
		return nil, 0, errors.New("search keyword cannot be empty")
	}
	return s.repoFactory.GetProductRepository().Search(keyword, page, pageSize)
} 