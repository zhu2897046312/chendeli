package service

import (
	"github.com/go-redis/redis/v8"
)

type ServiceFactory struct {
	base *Service
	redisClient *redis.Client
}

func NewServiceFactory(base *Service, redisClient *redis.Client) *ServiceFactory {
	return &ServiceFactory{
		base:     base,
		redisClient: redisClient,
	}
}

func (f *ServiceFactory) GetUserService() *UserService {
	return NewUserService(f.base)
}

func (f *ServiceFactory) GetProductService() *ProductService {
	return NewProductService(f.base,f.redisClient)
}

func (f *ServiceFactory) GetOrderService() *OrderService {
	return NewOrderService(f.base)
}

func (f *ServiceFactory) GetCartService() *CartService {
	return NewCartService(f.base)
}

func (f *ServiceFactory) GetAdvertisementService() *AdvertisementService {
	return NewAdvertisementService(f.base)
}

func (f *ServiceFactory) GetReviewService() *ReviewService {
	return NewReviewService(f.base)
}

func (f *ServiceFactory) GetPaymentService() *PaymentService {
	return NewPaymentService(f.base)
}

