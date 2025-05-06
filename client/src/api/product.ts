import request from './config';
import type { Product, ProductFilter, Review } from '@/types/product';
import type { PaginationResponse } from '@/types/base';

export const productApi = {
  // 获取商品列表
  getProducts: (params?: ProductFilter) => {
    return request.get<PaginationResponse<Product>>('/products', { params });
  },

  // 获取商品详情
  getProduct: (id: string) => {
    return request.get<Product>(`/products/${id}`);
  },

  // 按类别查询商品
  getProductsByCategory: (category: string, params?: ProductFilter) => {
    return request.get<PaginationResponse<Product>>(`/products/category/${category}`, { params });
  },

  // 搜索商品
  searchProducts: (keyword: string) => {
    return request.get<PaginationResponse<Product>>('/products/search', {
      params: { keyword }
    });
  },

  // 按类别筛选
  filterByCategory: (category: string) => {
    return request.get<PaginationResponse<Product>>('/products/filter/category', {
      params: { category }
    });
  },

  // 按价格区间筛选
  filterByPrice: (minPrice: number, maxPrice: number) => {
    return request.get<PaginationResponse<Product>>('/products/filter/price', {
      params: { minPrice, maxPrice }
    });
  },

  // 按标签筛选
  filterByTags: (tags: string[]) => {
    return request.get<PaginationResponse<Product>>('/products/filter/tags', {
      params: { tags: tags.join(',') }
    });
  },

  // 获取商品评论
  getProductReviews: (productId: string) => {
    return request.get<PaginationResponse<Review>>(`/products/${productId}/reviews`);
  }
};
