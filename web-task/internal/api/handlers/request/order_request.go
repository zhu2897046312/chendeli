package request

import (
	"web-task/internal/models"
)

// CreateOrderRequest 创建订单请求
type CreateOrderRequest struct {
	AddressID     uint               `json:"address_id"`
	OrderItems    []models.OrderItem `json:"items"`
}
