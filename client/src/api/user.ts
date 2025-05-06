import request from './config';
import type { CreateUserRequest, LoginUserRequest, UserProfileRequest, UpdateUserProfileRequest } from '@/types/user';
import type { BaseResponse } from '@/types/base';
export const userApi = {
  // 用户注册
  register: (data: CreateUserRequest) => {
    return request.post<BaseResponse<CreateUserRequest>>('/users/register', data);
  },

  // 用户登录
  login: (data: LoginUserRequest) => {
    return request.post<BaseResponse<null>>('/users/login', data);
  },

  // 获取用户信息
  getProfile: () => {
    return request.get<BaseResponse<UserProfileRequest>>('/users/profile');
  },

  // 更新用户信息
  updateProfile: (data: Partial<UserProfileRequest>) => {
    return request.put('/users/profile', data);
  },
  
};
