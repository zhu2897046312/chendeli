import request from './config';
import type { Review } from '@/types/product';
import type { PaginationResponse } from '@/types/base';

export const reviewApi = {
  // 创建评论
  createReview: (data: Omit<Review, 'id' | 'createdAt' | 'user'>) => {
    return request.post('/reviews', data);
  },

  // 获取用户评论列表
  getUserReviews: () => {
    return request.get<PaginationResponse<Review>>('/reviews/me');
  },

  // 删除评论
  deleteReview: (id: string) => {
    return request.delete(`/reviews/${id}`);
  }
};
