import request from './config';
import type { Order, OrderCreate, LogisticsInfo } from '../types/order';
import type { PaginationResponse } from '../types/base';

export const orderApi = {
  // 创建订单
  createOrder: (data: OrderCreate) => {
    return request.post<Order>('/orders', data);
  },

  // 获取订单列表
  getOrders: (params?: { status?: string; page?: number; pageSize?: number }) => {
    return request.get<PaginationResponse<Order>>('/orders', { params });
  },

  // 获取订单详情
  getOrder: (id: string) => {
    return request.get<Order>(`/orders/${id}`);
  },

  // 获取物流信息
  getLogistics: (orderId: string) => {
    return request.get<LogisticsInfo>(`/orders/${orderId}/logistics`);
  }
};
