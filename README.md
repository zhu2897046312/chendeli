# 笔记
```
这是因为 GORM 的一个特性：当使用 Updates 方法时，它默认不会更新零值字段（zero-value fields）。对于布尔类型，false 就是零值，所以当你尝试将 is_default 从 true 更新为 false 时，GORM 会忽略这个更新。

false 为零值 不会触发update更新操作，需要使用select进行强制更新


binding:"required"

在处理 JSON 绑定时，对于布尔类型的字段，即使提供了 false 值，binding:"required" 标签可能会认为这是一个零值而导致验证失败。让我们修改这个结构体的定义：
```