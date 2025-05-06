-- Active: 1734153169510@@172.25.13.23@3306@web

-- 生成50条评论的插入语句-- 生成50条评论的插入语句
INSERT INTO `reviews` (`user_id`, `product_id`, `order_id`, `rating`, `content`, `images`, `created_at`, `updated_at`) VALUES
(9, 1, 3, 5, '这款商品非常好，质量很好，使用体验不错！', '["http://example.com/image1.jpg"]', NOW(), NOW()),
(9, 2, 4, 4, '不错的产品，性价比高，唯一的缺点是有点小。', '["http://example.com/image2.jpg"]', NOW(), NOW()),
(9, 3, 5, 3, '商品一般，价格偏高，效果一般。', '["http://example.com/image3.jpg"]', NOW(), NOW()),
(9, 4, 6, 2, '商品不太符合我的预期，有点失望。', '["http://example.com/image4.jpg"]', NOW(), NOW()),
(9, 5, 7, 1, '非常差劲，完全不推荐购买。', '["http://example.com/image5.jpg"]', NOW(), NOW()),
(9, 6, 8, 4, '总体不错，送货速度也很快。', '["http://example.com/image6.jpg"]', NOW(), NOW()),
(9, 7, 9, 5, '超出预期，功能强大，非常实用！', '["http://example.com/image7.jpg"]', NOW(), NOW()),
(9, 8, 10, 3, '商品不错，但包装破损，客服没有及时回应。', '["http://example.com/image8.jpg"]', NOW(), NOW()),
(9, 9, 11, 5, '很满意，值得购买，赞！', '["http://example.com/image9.jpg"]', NOW(), NOW()),
(9, 10, 12, 4, '商品还不错，质量一般，适合日常使用。', '["http://example.com/image10.jpg"]', NOW(), NOW());


INSERT INTO `reviews` (`user_id`, `product_id`, `order_id`, `rating`, `content`, `images`, `created_at`, `updated_at`) VALUES
(10, 1, 73, 2, '不太好用，功能和描述不符。', '["http://example.com/image11.jpg"]', NOW(), NOW()),
(10, 2, 74, 3, '勉强可以接受，效果差强人意。', '["http://example.com/image12.jpg"]', NOW(), NOW()),
(10, 3, 75, 4, '挺好用的，值得推荐！', '["http://example.com/image13.jpg"]', NOW(), NOW()),
(10, 4, 76, 5, '非常好用，超出了预期！', '["http://example.com/image14.jpg"]', NOW(), NOW()),
(10, 5, 77, 3, '商品使用起来一般，期望更高一点。', '["http://example.com/image15.jpg"]', NOW(), NOW()),
(10, 6, 78, 5, '完美！非常喜欢这款产品，完全满足我的需求。', '["http://example.com/image16.jpg"]', NOW(), NOW()),
(10, 7,79, 4, '整体满意，能再便宜点就好了。', '["http://example.com/image17.jpg"]', NOW(), NOW()),
(10, 8, 80, 3, '还可以，质量不算特别好。', '["http://example.com/image18.jpg"]', NOW(), NOW()),
(10, 9, 81, 2, '不好用，不符合预期，客服态度差。', '["http://example.com/image19.jpg"]', NOW(), NOW()),
(10, 10, 82, 1, '极其不满意，完全不值这个价钱！', '["http://example.com/image20.jpg"]', NOW(), NOW());


INSERT INTO `reviews` (`user_id`, `product_id`, `order_id`, `rating`, `content`, `images`, `created_at`, `updated_at`) VALUES
(11, 1, 83, 4, '商品还可以，使用效果不错！', '["http://example.com/image21.jpg"]', NOW(), NOW()),
(11, 2, 84, 5, '推荐购买，质量一流！', '["http://example.com/image22.jpg"]', NOW(), NOW()),
(11, 3, 85, 3, '一般，差强人意，没有特别惊艳的地方。', '["http://example.com/image23.jpg"]', NOW(), NOW()),
(11, 4, 86, 4, '感觉不错，性价比高。', '["http://example.com/image24.jpg"]', NOW(), NOW()),
(11, 5, 87, 5, '超级好，完全符合描述，赞！', '["http://example.com/image25.jpg"]', NOW(), NOW()),
(11, 6, 88, 3, '使用起来中规中矩，没什么特别的。', '["http://example.com/image26.jpg"]', NOW(), NOW()),
(11, 7, 89, 4, '不错，整体还行，价格适中。', '["http://example.com/image27.jpg"]', NOW(), NOW()),
(11, 8, 90, 5, '非常喜欢，强烈推荐！', '["http://example.com/image28.jpg"]', NOW(), NOW()),
(11, 9, 91, 3, '效果一般，价格高了点。', '["http://example.com/image29.jpg"]', NOW(), NOW()),
(11, 10, 92, 4, '比较满意，但可以做得更好。', '["http://example.com/image30.jpg"]', NOW(), NOW());

INSERT INTO `reviews` (`user_id`, `product_id`, `order_id`, `rating`, `content`, `images`, `created_at`, `updated_at`) VALUES
(12, 1, 93, 5, '完全超出了我的期望！', '["http://example.com/image31.jpg"]', NOW(), NOW()),
(12, 2, 94, 2, '差评，完全不如想象中的好。', '["http://example.com/image32.jpg"]', NOW(), NOW()),
(12, 3, 95, 3, '一般般，算是中等吧。', '["http://example.com/image33.jpg"]', NOW(), NOW()),
(12, 4, 96, 4, '总体不错，符合预期。', '["http://example.com/image34.jpg"]', NOW(), NOW()),
(12, 5, 97, 5, '完美！非常推荐购买。', '["http://example.com/image35.jpg"]', NOW(), NOW()),
(12, 6, 98, 3, '商品中等，使用体验一般。', '["http://example.com/image36.jpg"]', NOW(), NOW()),
(12, 7, 99, 4, '整体还行，值得购买。', '["http://example.com/image37.jpg"]', NOW(), NOW()),
(12, 8, 100, 5, '喜欢这款产品，超好用。', '["http://example.com/image38.jpg"]', NOW(), NOW()),
(12, 9, 101, 2, '一般般，不符合期望。', '["http://example.com/image39.jpg"]', NOW(), NOW()),
(12, 10, 102, 1, '非常差，完全不能使用。', '["http://example.com/image40.jpg"]', NOW(), NOW());

INSERT INTO `reviews` (`user_id`, `product_id`, `order_id`, `rating`, `content`, `images`, `created_at`, `updated_at`) VALUES
(13, 1, 103, 4, '整体不错，使用还算方便。', '["http://example.com/image41.jpg"]', NOW(), NOW()),
(13, 2, 104, 5, '值得购买，性价比高！', '["http://example.com/image42.jpg"]', NOW(), NOW()),
(13, 3, 105, 3, '效果一般，价格偏贵。', '["http://example.com/image43.jpg"]', NOW(), NOW()),
(13, 4, 106, 4, '还不错，使用起来方便。', '["http://example.com/image44.jpg"]', NOW(), NOW()),
(13, 5, 107, 5, '非常喜欢这款产品，超级好用！', '["http://example.com/image45.jpg"]', NOW(), NOW()),
(13, 6, 108, 3, '一般般，没有特别突出。', '["http://example.com/image46.jpg"]', NOW(), NOW()),
(13, 7, 109, 4, '整体效果还可以。', '["http://example.com/image47.jpg"]', NOW(), NOW()),
(13, 8, 110, 5, '非常喜欢，超出预期！', '["http://example.com/image48.jpg"]', NOW(), NOW()),
(13, 9, 111, 3, '效果还行，但不值这个价。', '["http://example.com/image49.jpg"]', NOW(), NOW()),
(13, 10, 112, 4, '还可以，适合日常使用。', '["http://example.com/image50.jpg"]', NOW(), NOW());

