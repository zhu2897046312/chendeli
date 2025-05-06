import request from './config';
import type { CartItem } from '../types/cart';

export const cartApi = {
  // 添加购物车项
  addItem: (data: Omit<CartItem, 'id'>) => {
    return request.post('/cart/items', data);
  },

  // 获取购物车列表
  getItems: () => {
    return request.get<CartItem[]>('/cart/items');
  },

  // 删除购物车项
  removeItem: (id: string) => {
    return request.delete(`/cart/items/${id}`);
  },

  // 更新购物车项
  updateItem: (id: string, data: Partial<CartItem>) => {
    return request.put(`/cart/items/${id}`, data);
  },

  // 全选/取消全选购物车项
  selectAll: (selected: boolean) => {
    return request.put('/cart/select-all', { selected });
  },

  // 获取已选择的购物车项
  getSelectedItems: () => {
    return request.get<CartItem[]>('/cart/selected');
  }
};
