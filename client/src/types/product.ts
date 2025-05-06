import { PaginationParams, PaginationResponse, StatsData } from './base'

// 商品数据模型
export interface Product {
  id: number
  name: string
  description: string
  category_id: number
  category: ProductCategory
  price: number
  original_price: number
  stock: number
  sales: number
  images: string[]
  status: ProductStatus
  attributes: Record<string, string>
  created_at: string
  updated_at: string
}

// 商品列表查询参数
export interface ListProductParams extends PaginationParams {
  category_id?: number
  status?: ProductStatus
  keyword?: string
  min_price?: number
  max_price?: number
  sort_by?: string
  sort_order?: 'asc' | 'desc'
}

// 商品列表响应
export type ListProductResponse = PaginationResponse<Product>

// 创建商品请求参数
export interface CreateProductRequest {
  name: string
  description: string
  category_id: number
  price: number
  original_price: number
  stock: number
  images: string[]
  status: ProductStatus
  attributes: Record<string, string>
}

// 更新商品请求参数
export interface UpdateProductRequest {
  name?: string
  description?: string
  category_id?: number
  price?: number
  original_price?: number
  stock?: number
  images?: string[]
  status?: ProductStatus
  attributes?: Record<string, string>
}

// 商品统计信息
export interface ProductStats {
  total_count: number
  active_count: number
  inactive_count: number
  out_of_stock_count: number
  category_count: number
  total_sales: number
  total_amount: number
}

// 商品状态
export enum ProductStatus {
  Active = 'active',     // 上架
  Inactive = 'inactive', // 下架
  OutOfStock = 'out_of_stock' // 缺货
}

// 商品分类
// 商品分类枚举
export enum ProductCategory {
  Clothing = 'clothing',      // 服装
  Electronics = 'electronics', // 电子产品
  Food = 'food',              // 食品
  Books = 'books',            // 图书
  Beauty = 'beauty',          // 美妆
  Sports = 'sports',          // 运动
  Home = 'home',              // 家居
  Toys = 'toys'               // 玩具
}

// 分类显示名称映射
export const ProductCategoryNames: Record<ProductCategory, string> = {
  [ProductCategory.Clothing]: '服装',
  [ProductCategory.Electronics]: '电子产品',
  [ProductCategory.Food]: '食品',
  [ProductCategory.Books]: '图书',
  [ProductCategory.Beauty]: '美妆',
  [ProductCategory.Sports]: '运动',
  [ProductCategory.Home]: '家居',
  [ProductCategory.Toys]: '玩具'
}

// 分类列表查询参数
export interface ListCategoryParams extends PaginationParams {
  parent_id?: number
  keyword?: string
}

// 分类列表响应
export type ListCategoryResponse = PaginationResponse<ProductCategory>

// 创建分类请求
export interface CreateCategoryRequest {
  name: string
  description?: string
  parent_id?: number
  sort_order?: number
  image?: string
}

// 更新分类请求
export interface UpdateCategoryRequest {
  name?: string
  description?: string
  parent_id?: number
  sort_order?: number
  image?: string
}

// 更新商品状态请求
export interface UpdateProductStatusRequest {
  status: ProductStatus
} 

export interface Review {
  id: number
  user_id: number
  product_id: number
  rating: number
  comment: string
  created_at: string
  updated_at: string
}

export interface ProductFilter {
  category_id?: number
  status?: ProductStatus
}