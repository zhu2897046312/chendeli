import request from './config';
import type { Payment, PaymentStatus } from '../types/payment';

export const paymentApi = {
  // 创建支付
  createPayment: (data: { orderId: string; paymentMethod: string }) => {
    return request.post<Payment>('/payments', data);
  },

  // 查询支付状态
  getPaymentStatus: (id: string) => {
    return request.get<PaymentStatus>(`/payments/${id}/status`);
  }
};
