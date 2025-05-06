import request from './config';
import type { Advertisement } from '../types/advertisement';

export const advertisementApi = {
  // 获取活动广告
  getActiveAds: () => {
    return request.get<Advertisement[]>('/advertisements');
  },

  // 根据位置获取广告
  getAdsByPosition: (position: string) => {
    return request.get<Advertisement[]>(`/advertisements/position/${position}`);
  }
};
