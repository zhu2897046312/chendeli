package middleware

import (
	"context"
	"github.com/gin-gonic/gin"
	"go.mongodb.org/mongo-driver/mongo"
	"log"
	"time"
)

func Logger(mongoClient *mongo.Client, dbName string) gin.HandlerFunc {
	return func(c *gin.Context) {
		start := time.Now()
		path := c.Request.URL.Path
		method := c.Request.Method

		// 处理请求
		c.Next()

		// 收集日志数据
		latency := time.Since(start)
		statusCode := c.Writer.Status()
		clientIP := c.ClientIP()
		userAgent := c.Request.UserAgent()

		// 从上下文中获取用户信息（如果有）
		userID, _ := c.Get("userID")
		username, _ := c.Get("username")

		// 控制台输出
		log.Printf("[%d] %s %s %v", statusCode, method, path, latency)

		// 如果MongoDB客户端存在，则记录到MongoDB
		if mongoClient != nil {
			// 创建日志文档
			logEntry := map[string]interface{}{
				"timestamp":   start,
				"latency":     latency.String(),
				"latency_ms":  latency.Milliseconds(),
				"path":        path,
				"method":      method,
				"status":      statusCode,
				"client_ip":   clientIP,
				"user_agent":  userAgent,
				"user_id":     userID,
				"username":    username,
				"request_id":  c.GetString("requestID"), // 如果需要可以添加请求ID
			}

			// 异步写入MongoDB
			go func() {
				collection := mongoClient.Database(dbName).Collection("http_logs")
				_, err := collection.InsertOne(context.Background(), logEntry)
				if err != nil {
					log.Printf("Failed to write log to MongoDB: %v", err)
				}
			}()
		}
	}
}