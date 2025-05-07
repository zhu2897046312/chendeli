package main

import (
    "context"
    "fmt"
    "log"
    "web-task/internal/api"
    "web-task/internal/config"
    "web-task/internal/models"
    "web-task/internal/repository"
    "web-task/internal/service"
    
    "go.mongodb.org/mongo-driver/mongo"
    "go.mongodb.org/mongo-driver/mongo/options"
    
    "github.com/gin-gonic/gin"
)

func main() {
    // 初始化配置
    if err := config.Init(); err != nil {
        log.Fatalf("配置初始化失败: %v", err)
    }

    // 初始化数据库连接
    db, err := models.InitDB()
    if err != nil {
        log.Fatalf("数据库初始化失败: %v", err)
    }

    // 创建仓储工厂
    repoFactory := repository.NewRepositoryFactory(db)

    // 创建服务工厂
    baseService := service.NewService(repoFactory)
    serviceFactory := service.NewServiceFactory(baseService)

    // 创建 Gin 引擎
    r := gin.Default()

    // 使用配置中的MongoDB设置初始化客户端
    mongoClient, err := mongo.Connect(context.Background(), 
        options.Client().ApplyURI(config.GlobalConfig.MongoDB.URI()))
    if err != nil {
        log.Fatal("Failed to connect to MongoDB:", err)
    }
    
    // 确保MongoDB连接正常
    err = mongoClient.Ping(context.Background(), nil)
    if err != nil {
        log.Fatal("Failed to ping MongoDB:", err)
    }
    defer func() {
        if err = mongoClient.Disconnect(context.Background()); err != nil {
            log.Fatal("Failed to disconnect MongoDB:", err)
        }
    }()

    // 初始化路由
    api.RegisterRoutes(r, serviceFactory, db, mongoClient)

    // 启动服务器
    port := config.GlobalConfig.Server.Port
    log.Printf("服务器启动在 :%d", port)
    log.Fatal(r.Run(fmt.Sprintf(":%d", port)))
}