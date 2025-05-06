import { IDRequest, PaginationParams } from './base'

// 用户角色枚举
export enum UserRole {
  User = 'user',
  Admin = 'admin'
}

// 用户状态枚举
export enum UserStatus {
  Active = 'active',
  Inactive = 'inactive'
}

// 注册、新增用户请求
export interface CreateUserRequest {
  email : string
  nickname: string  
  password: string
  role: UserRole
  avatar: string
}

// 登录用户请求
export interface LoginUserRequest {
  email: string
  password: string
}

// 用户信息
export interface UserProfileRequest  extends IDRequest {}

// 更新用户信息
export interface UpdateUserProfileRequest {
  nickname: string  
  avatar: string
}

// 用户列表查询参数
export interface ListUserParams extends PaginationParams {}
