-- Active: 1734153169510@@172.25.13.23@3306@web

-- 插入 "电脑/配件/办公/文具" 分类的 10 条产品
INSERT INTO products (name, description, price, stock, sales, rating, status, images, category, tags, created_at, updated_at)
VALUES
('电脑', '高性能电脑', 5999.99, 50, 100, 4.5, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.qwuvMkYMsESHZg3ouqN9ZwHaHa?w=194&h=194&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '电脑', '["电子产品", "电脑"]', NOW(), NOW()),
('显示器', '高清显示器', 1299.99, 30, 50, 4.3, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.KH3JLnwVKXuVciWfMySWXQHaHa?w=202&h=202&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '配件', '["显示器", "配件"]', NOW(), NOW()),
('办公桌', '现代办公桌', 799.99, 20, 30, 4.2, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.AWu5E41uP4jvyJnQuMDddAHaHa?w=211&h=211&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '办公', '["办公", "家具"]', NOW(), NOW()),
('打印机', '高速打印机', 1200.50, 15, 10, 4.0, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.BErh1IQbmkGzuqNMqhQargHaHa?w=211&h=211&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '配件', '["打印机", "办公"]', NOW(), NOW()),
('耳机', '高质量耳机', 299.99, 100, 200, 4.6, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.GtAKemB0bU46lF1Y-B-OnQHaHa?w=197&h=197&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '电脑', '["耳机", "配件"]', NOW(), NOW()),
('办公椅', '人体工学办公椅', 999.99, 25, 50, 4.7, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.VhmG99jyLcp-Ux5f6zNRUAHaHa?w=212&h=212&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '办公', '["椅子", "办公"]', NOW(), NOW()),
('文具套装', '全套文具', 99.99, 200, 300, 4.8, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.GRCaZToEgEgu8d58vtBZygHaE8?w=374&h=204&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '文具', '["文具", "办公"]', NOW(), NOW()),
('鼠标', '无线鼠标', 150.00, 80, 150, 4.4, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.CpPPT7JfmrXZ9vEKqH5WjAHaHa?w=202&h=202&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '配件', '["鼠标", "配件"]', NOW(), NOW()),
('键盘', '机械键盘', 499.99, 60, 80, 4.5, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.tqsRRdR0a6SbUqac5FVvngHaHa?w=198&h=198&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '电脑', '["键盘", "配件"]', NOW(), NOW()),
('文件夹', '多功能文件夹', 30.99, 150, 200, 4.3, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.BYaI3TDqgGSZvikP3FaAIQHaG0?w=228&h=210&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '文具', '["文件夹", "办公"]', NOW(), NOW());

-- 插入 "工业品/商业/农业/定制" 分类的 10 条产品
INSERT INTO products (name, description, price, stock, sales, rating, status, images, category, tags, created_at, updated_at)
VALUES
('工业机械', '大型工业机械设备', 12000.00, 5, 10, 4.6, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.I4Qvd7fvm728ly4oV-F0rwHaEK?w=288&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '工业品', '["工业设备", "机械"]', NOW(), NOW()),
('商用冰箱', '大容量商用冰箱', 3000.00, 20, 40, 4.3, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.HsUG1mgKyjLkz6Q3hBh0hwHaHa?w=206&h=206&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '商业', '["冰箱", "商用"]', NOW(), NOW()),
('农业工具', '高效农业工具', 250.00, 100, 200, 4.2, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.H_CiNHJjzqwdr3Dazln4IAHaFP?w=262&h=185&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '农业', '["工具", "农业"]', NOW(), NOW()),
('定制名片', '高端定制名片', 100.00, 500, 1000, 4.8, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.l4m8f_eH6YU7At6_EPKPYAHaFj?w=268&h=201&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '定制', '["名片", "定制"]', NOW(), NOW()),
('工业泵', '精密工业泵', 1500.00, 30, 50, 4.4, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.HYz5wS52syZrc8ug2WtYeQHaE8?w=286&h=191&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '工业品', '["工业", "泵"]', NOW(), NOW()),
('定制家具', '量身定制家具', 8000.00, 10, 20, 4.7, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.QfEnHlJtujTo5ucjMGxo4wHaF7?w=233&h=186&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '定制', '["家具", "定制"]', NOW(), NOW()),
('农业肥料', '高效农业肥料', 200.00, 200, 400, 4.5, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.XAyoOoLfEbgbvQldDKk88AAAAA?w=207&h=206&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '农业', '["肥料", "农业"]', NOW(), NOW()),
('商业照明', 'LED商业照明设备', 1000.00, 50, 80, 4.6, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.P8OeYrYnX4tLNHePTJVm0gHaHa?w=167&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '商业', '["照明", "商业"]', NOW(), NOW()),
('工业过滤器', '高效工业过滤器', 500.00, 15, 25, 4.3, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.eZBRNGeS5k0AYrjgEU3A3QHaHa?w=196&h=196&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '工业品', '["过滤器", "工业"]', NOW(), NOW()),
('定制T恤', '个性化定制T恤', 150.00, 200, 300, 4.9, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.TD-5XVCv6ntBf1GD4O-H2QHaGX?w=224&h=192&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '定制', '["T恤", "定制"]', NOW(), NOW());

-- 插入 "家电/手机/通信/数码" 分类的 10 条产品
INSERT INTO products (name, description, price, stock, sales, rating, status, images, category, tags, created_at, updated_at)
VALUES
('智能电视', '4K智能电视', 4500.00, 30, 50, 4.8, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.S0LlXeNZVs1VCFbQg9OcQAHaFw?w=249&h=194&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '家电', '["电视", "智能"]', NOW(), NOW()),
('智能手机', '最新款智能手机', 2999.00, 100, 200, 4.7, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.G70JEGBrtDHAbuRatBfVpQHaHa?w=193&h=194&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '手机', '["手机", "智能"]', NOW(), NOW()),
('蓝牙耳机', '无线蓝牙耳机', 499.99, 200, 300, 4.6, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.hIBcEXqotaqMV3cBmsXS5gHaHa?w=220&h=220&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '数码', '["耳机", "数码"]', NOW(), NOW()),
('智能手表', '运动智能手表', 899.99, 150, 250, 4.4, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.PDHV3PYxLARKZ0yphqTT9gHaHa?w=210&h=210&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '数码', '["手表", "智能"]', NOW(), NOW()),
('冰箱', '双门冰箱', 1800.00, 50, 80, 4.5, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.sFGtJbVrZKjuguF1Z_dEGgHaHa?w=215&h=215&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '家电', '["冰箱", "家电"]', NOW(), NOW()),
('无线耳机', '真无线耳机', 399.99, 80, 120, 4.3, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.RVJZ2Nmvn24ILGPA7vAeTQHaHa?w=217&h=217&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '数码', '["耳机", "无线"]', NOW(), NOW()),
('电吹风', '专业电吹风', 199.99, 60, 100, 4.2, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.gsfHtv79MAWbva7EaqyH9wHaHa?w=217&h=217&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '家电', '["吹风机", "家电"]', NOW(), NOW()),
('平板电脑', '高性能平板电脑', 2000.00, 40, 60, 4.7, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.JYrQwwlUqngNOlzJJh4ntgHaHa?w=211&h=211&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '数码', '["平板", "数码"]', NOW(), NOW()),
('智能音响', '家庭智能音响', 599.99, 70, 100, 4.4, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.UqdoTRZiF9TPXNn8NzEkSAHaHa?w=211&h=211&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '数码', '["音响", "智能"]', NOW(), NOW()),
('电热水壶', '电热水壶', 150.00, 100, 150, 4.3, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.U14bb5pEGUp952gWVpdq7wHaHa?w=210&h=210&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '家电', '["水壶", "家电"]', NOW(), NOW());

-- 插入 "家具/家装/家居/服饰" 分类的 10 条产品
INSERT INTO products (name, description, price, stock, sales, rating, status, images, category, tags, created_at, updated_at)
VALUES
('沙发', '豪华沙发', 2500.00, 20, 30, 4.7, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.divwlLVYNiRYEIx7ZLtX9QHaGF?w=228&h=187&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '家具', '["沙发", "家具"]', NOW(), NOW()),
('餐桌', '现代餐桌', 1000.00, 25, 40, 4.5, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.gws2tz8uvnWgGrhhEZjrpwHaHa?w=202&h=202&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '家具', '["餐桌", "家具"]', NOW(), NOW()),
('床垫', '记忆床垫', 1500.00, 15, 25, 4.8, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.Z7a_w3dhua0EA88yHjUHygHaMm?w=115&h=193&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '家具', '["床垫", "家具"]', NOW(), NOW()),
('衣柜', '多功能衣柜', 1200.00, 30, 50, 4.6, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.PJ_J6GOCfmKt6OTkbJXv2AHaFj?w=263&h=197&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '家具', '["衣柜", "家具"]', NOW(), NOW()),
('卧室灯', '豪华卧室灯', 200.00, 100, 150, 4.3, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.EGpVPtNJKTzEUmn8oZixqQHaIX?w=183&h=207&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '家装', '["灯具", "卧室"]', NOW(), NOW()),
('书桌', '现代书桌', 800.00, 50, 100, 4.5, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.ccyvMguUwoLcLPhZ7zAuaAHaHa?w=204&h=204&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '家具', '["书桌", "家具"]', NOW(), NOW()),
('地毯', '高品质地毯', 300.00, 150, 200, 4.4, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.u43_EGOnrebinBDpVNKLMQHaHa?w=184&h=184&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '家居', '["地毯", "家居"]', NOW(), NOW()),
('装饰画', '艺术装饰画', 250.00, 100, 150, 4.6, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.dRlkRAZXEpXcayCfGYZdSgHaHa?w=197&h=197&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '家居', '["装饰", "画"]', NOW(), NOW()),
('窗帘', '豪华窗帘', 500.00, 80, 120, 4.7, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.fqWKI6c3TxIu3zHV5SAHFAHaII?w=189&h=208&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '家装', '["窗帘", "家装"]', NOW(), NOW()),
('羽绒服', '冬季羽绒服', 699.99, 200, 300, 4.8, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.s-PNrkfIZ1Hr9IG_Qo013QHaMG?w=194&h=317&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '服饰', '["羽绒服", "服饰"]', NOW(), NOW());

-- 继续为剩余分类写 SQL...
-- 插入 "女装/男装/内衣/配饰" 分类的 10 条产品
INSERT INTO products (name, description, price, stock, sales, rating, status, images, category, tags, created_at, updated_at)
VALUES
('连衣裙', '夏季连衣裙', 299.99, 150, 200, 4.6, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.tWgdpabHOf5eVa_ObbJJhgHaLT?w=140&h=213&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '女装', '["连衣裙", "女装"]', NOW(), NOW()),
('T恤', '男士舒适T恤', 99.99, 200, 300, 4.3, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.SCBHCKcJk1nKR5CxqATgzQHaHa?w=208&h=208&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '男装', '["T恤", "男装"]', NOW(), NOW()),
('内衣', '女士性感内衣', 159.99, 100, 150, 4.5, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.DF-Ayj0_762baEXY_XiPuQHaHa?w=188&h=196&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '内衣', '["内衣", "女士"]', NOW(), NOW()),
('牛仔裤', '男士牛仔裤', 199.99, 120, 180, 4.4, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.xMu5fvEZRKaLHRt58nDxagHaJV?w=168&h=212&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '男装', '["牛仔裤", "男装"]', NOW(), NOW()),
('丝巾', '女性优雅丝巾', 79.99, 300, 500, 4.7, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.rIP4PPF5cy_nZEWlJZFfxwHaLH?w=142&h=213&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '配饰', '["丝巾", "配饰"]', NOW(), NOW()),
('羽绒服', '女士羽绒服', 899.99, 80, 100, 4.8, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.0iSIZo5jE7siyKZUyPE6lwHaHa?w=194&h=194&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '女装', '["羽绒服", "女装"]', NOW(), NOW()),
('西装', '男士西装', 1500.00, 50, 80, 4.6, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.6M13ro6nw8qSy_hqY14_SAHaIO?w=194&h=215&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '男装', '["西装", "男装"]', NOW(), NOW()),
('背包', '时尚背包', 199.99, 100, 200, 4.4, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.A8TxqRUDAY4F3rfkJupDfgHaHa?w=215&h=215&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '配饰', '["背包", "配饰"]', NOW(), NOW()),
('短裙', '女士百搭短裙', 119.99, 250, 400, 4.7, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.u0REUdI0An9nFCRjZ9LsFAHaLF?w=131&h=196&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '女装', '["短裙", "女装"]', NOW(), NOW()),
('领带', '男士经典领带', 89.99, 150, 250, 4.5, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.jDyFXPcSfaFV9nJciWBpPgHaHa?w=216&h=216&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '配饰', '["领带", "配饰"]', NOW(), NOW());

-- 插入 "女鞋/男鞋/运动/户外" 分类的 10 条产品
INSERT INTO products (name, description, price, stock, sales, rating, status, images, category, tags, created_at, updated_at)
VALUES
('高跟鞋', '时尚高跟鞋', 499.99, 80, 120, 4.6, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.APPaIFbIL-C-ab7rD52B6wHaHa?w=210&h=210&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '女鞋', '["高跟鞋", "女鞋"]', NOW(), NOW()),
('运动鞋', '舒适运动鞋', 299.99, 150, 200, 4.4, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.eGOck-GO8UoR9kdW-JjTkQHaHa?w=192&h=192&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '运动', '["运动鞋", "运动"]', NOW(), NOW()),
('拖鞋', '夏季拖鞋', 49.99, 300, 500, 4.5, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.GGlz5CQkPA_vKlYK2C8zxgAAAA?w=296&h=198&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '男鞋', '["拖鞋", "男鞋"]', NOW(), NOW()),
('跑步鞋', '跑步专用运动鞋', 799.99, 100, 150, 4.7, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.mMoXd2QBWIb7wlKjcwoD_AHaHa?w=211&h=211&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '运动', '["跑步鞋", "运动"]', NOW(), NOW()),
('滑雪靴', '滑雪专用靴子', 1299.99, 40, 60, 4.6, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.GQ1uMDIZggosQ5XjMTIURgHaHa?w=212&h=212&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '户外', '["滑雪靴", "户外"]', NOW(), NOW()),
('凉鞋', '夏季凉鞋', 169.99, 250, 400, 4.4, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.fxxjbt5K98axU-TKSynNPQHaHa?w=206&h=206&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '女鞋', '["凉鞋", "女鞋"]', NOW(), NOW()),
('登山鞋', '专业登山鞋', 899.99, 30, 50, 4.7, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.a4H15I_cEa2yNGWq9SHEIQHaHa?w=210&h=210&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '户外', '["登山鞋", "户外"]', NOW(), NOW()),
('皮鞋', '经典皮鞋', 599.99, 120, 200, 4.5, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.yHtULA0Qh9VeygmqPFSCzAHaE7?w=279&h=186&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '男鞋', '["皮鞋", "男鞋"]', NOW(), NOW()),
('运动拖鞋', '运动休闲拖鞋', 119.99, 150, 200, 4.3, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.plkE_bm29yUACI6j7xUBTQHaHa?w=215&h=215&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '运动', '["拖鞋", "运动"]', NOW(), NOW()),
('沙滩鞋', '沙滩度假鞋', 79.99, 200, 300, 4.5, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.SNwd6YNvLVwEUKX7NHYeqQHaHa?w=200&h=200&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '男鞋', '["沙滩鞋", "男鞋"]', NOW(), NOW());

-- 插入 "汽车/珠宝/玩具/箱包" 分类的 10 条产品
INSERT INTO products (name, description, price, stock, sales, rating, status, images, category, tags, created_at, updated_at)
VALUES
('汽车座椅', '舒适汽车座椅', 1200.00, 40, 60, 4.6, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.R5kmFqC_9KRS9tpMrf36oQHaHa?w=190&h=190&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '汽车', '["座椅", "汽车"]', NOW(), NOW()),
('汽车导航', '高清汽车导航仪', 999.99, 50, 80, 4.5, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.vBE4iSRSYRnhn1ojAzODnQHaHa?w=186&h=186&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '汽车', '["导航", "汽车"]', NOW(), NOW()),
('珠宝项链', '高端珠宝项链', 1500.00, 10, 20, 4.8, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.cewm60wYio29_vvvkYNQ9wHaHa?w=184&h=185&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '珠宝', '["项链", "珠宝"]', NOW(), NOW()),
('汽车轮胎', '高性能汽车轮胎', 450.00, 100, 200, 4.4, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.uXuo7QNKCZFkExe633KeOQHaE8?w=237&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '汽车', '["轮胎", "汽车"]', NOW(), NOW()),
('玩具车', '遥控玩具车', 199.99, 150, 300, 4.3, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.aPzd2_HkfPsj4_MvR5RLWgHaHa?w=204&h=204&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '玩具', '["遥控车", "玩具"]', NOW(), NOW()),
('儿童玩具', '益智儿童玩具', 99.99, 200, 400, 4.6, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.CJll6GXm0prWk4g2XXhVcwHaJ4?w=163&h=217&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '玩具', '["益智", "儿童"]', NOW(), NOW()),
('手链', '女士精美手链', 249.99, 120, 180, 4.5, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.T_LeOx7FoEGESbi1Tnad0gHaHa?w=210&h=210&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '珠宝', '["手链", "珠宝"]', NOW(), NOW()),
('箱包', '旅行箱包', 799.99, 50, 70, 4.7, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.N3yqNq8D5OMd0AdTDR5OWAHaHa?w=211&h=211&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '箱包', '["旅行", "箱包"]', NOW(), NOW()),
('背包', '学生背包', 159.99, 300, 500, 4.4, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.JKEwDLX8HftNhAcqgK_JwAHaHa?w=217&h=218&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '箱包', '["背包", "箱包"]', NOW(), NOW()),
('珠宝耳环', '钻石珠宝耳环', 1999.99, 10, 20, 4.9, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.vWKpfOmk99-GRKmYXzyDZwHaE8?w=286&h=191&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '珠宝', '["耳环", "珠宝"]', NOW(), NOW());

-- 插入 "食品/生鲜/酒类/健康" 分类的 10 条产品
INSERT INTO products (name, description, price, stock, sales, rating, status, images, category, tags, created_at, updated_at)
VALUES
('有机蔬菜', '新鲜有机蔬菜', 29.99, 200, 300, 4.6, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.0zRx4sSLazMPdzPz4NMZHgHaFQ?w=273&h=194&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '食品', '["蔬菜", "有机"]', NOW(), NOW()),
('红酒', '精选红酒', 199.99, 50, 80, 4.8, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.0UZLGqyZIF8RI6lKRT4cPAHaHa?w=204&h=204&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '酒类', '["红酒", "酒类"]', NOW(), NOW()),
('健康茶', '绿色健康茶', 79.99, 300, 500, 4.7, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.PMTpcNIbP4WO8Ehhx4BpBAHaEK?w=283&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '健康', '["茶", "健康"]', NOW(), NOW()),
('速冻水饺', '手工速冻水饺', 39.99, 100, 150, 4.5, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.KjCyno28XXkWc0ml4iiEQgHaHa?w=189&h=189&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '食品', '["速冻", "食品"]', NOW(), NOW()),
('蜂蜜', '纯天然蜂蜜', 59.99, 200, 300, 4.6, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.xc0sOqZdncTM4B66LawQAQHaHa?w=192&h=192&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '健康', '["蜂蜜", "健康"]', NOW(), NOW()),
('啤酒', '进口啤酒', 99.99, 150, 200, 4.4, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.mf6JyC5rvOqjPBN2B9-OCQHaHa?w=220&h=220&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '酒类', '["啤酒", "酒类"]', NOW(), NOW()),
('鲜果', '新鲜水果', 19.99, 500, 800, 4.5, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.I1HoenjxohxEUipHqNJNFAHaE7?w=286&h=191&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '食品', '["水果", "食品"]', NOW(), NOW()),
('营养品', '保健营养品', 149.99, 120, 200, 4.6, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.hFwZrt7xNSiFIHI7tLk2QQHaHa?w=170&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '健康', '["营养", "健康"]', NOW(), NOW()),
('健康食品', '无添加健康食品', 129.99, 100, 150, 4.4, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.g0rMrSglR0H9TUL_InixsgHaHa?w=178&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '食品', '["健康", "食品"]', NOW(), NOW()),
('酒具', '酒类配件', 39.99, 200, 300, 4.7, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.Hy3CDJhxae53dCNNy_NI0AHaHa?w=189&h=189&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '酒类', '["酒具", "酒类"]', NOW(), NOW());

-- 插入 "母婴/童装/玩具/宠物" 分类的 10 条产品
INSERT INTO products (name, description, price, stock, sales, rating, status, images, category, tags, created_at, updated_at)
VALUES
('婴儿车', '高品质婴儿车', 999.99, 30, 50, 4.8, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.zFhmmvovcWy6sKBN3HMK0gHaHa?w=199&h=199&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '母婴', '["婴儿车", "母婴"]', NOW(), NOW()),
('婴儿奶粉', '有机婴儿奶粉', 159.99, 100, 150, 4.7, 'active', '["https://m.360buyimg.com/mobilecms/s750x750_jfs/t1/118632/10/8166/180599/5ecb60cbEdba738f3/75c6aa1fbacfe2a5.jpg!q80.dpg"]', '母婴', '["奶粉", "婴儿"]', NOW(), NOW()),
('童装', '儿童舒适衣服', 89.99, 200, 300, 4.6, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.2edFaKSxuMTaylknv9o4OAHaHa?w=209&h=209&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '童装', '["儿童", "衣服"]', NOW(), NOW()),
('宝宝玩具', '益智宝宝玩具', 79.99, 150, 250, 4.5, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.k1QbfeGdZYNQVoEqbz8mWgHaHa?w=209&h=209&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '玩具', '["宝宝", "益智"]', NOW(), NOW()),
('宠物零食', '宠物美味零食', 39.99, 200, 300, 4.6, 'active', '["https://tse4-mm.cn.bing.net/th/id/OIP-C.KT0fzleeVW7Xb-m5rZOVKwHaHa?w=200&h=200&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '宠物', '["宠物", "零食"]', NOW(), NOW()),
('玩具车', '儿童遥控玩具车', 159.99, 120, 180, 4.4, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.Nv7KArFPyLfOuxB7zLNTYAHaHa?w=193&h=193&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '玩具', '["遥控车", "玩具"]', NOW(), NOW()),
('婴儿尿布', '舒适婴儿尿布', 129.99, 300, 500, 4.7, 'active', '["https://tse1-mm.cn.bing.net/th/id/OIP-C.YiGUbUibBIP3KMmU-C-ZTwHaHa?w=270&h=203&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '母婴', '["尿布", "婴儿"]', NOW(), NOW()),
('儿童鞋', '舒适儿童鞋', 69.99, 150, 200, 4.5, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.Dxb5BbnN4Ccd09WOAJmbygHaHa?w=208&h=208&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '童装', '["鞋子", "儿童"]', NOW(), NOW()),
('宠物玩具', '宠物专用玩具', 49.99, 200, 300, 4.4, 'active', '["https://tse3-mm.cn.bing.net/th/id/OIP-C.ANP81mTzKAiSwVHxnrTkNAHaHa?w=217&h=218&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '宠物', '["玩具", "宠物"]', NOW(), NOW()),
('儿童背包', '儿童卡通背包', 79.99, 250, 400, 4.6, 'active', '["https://tse2-mm.cn.bing.net/th/id/OIP-C.TOP3vpDiFagrcpCnLhjivQHaHi?w=209&h=213&c=7&r=0&o=5&dpr=1.3&pid=1.7"]', '童装', '["背包", "儿童"]', NOW(), NOW());
