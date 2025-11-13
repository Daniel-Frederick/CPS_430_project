package main

import (
	"github.com/gin-gonic/gin"
	"react-go-sql/backend/db"
	"react-go-sql/backend/handlers"
)

func main() {
	db.InitDB("./school.db")

	r := gin.Default()

	// Enable CORS
	r.Use(func(c *gin.Context) {
		c.Writer.Header().Set("Access-Control-Allow-Origin", "*")
		c.Writer.Header().Set("Access-Control-Allow-Headers", "Content-Type")
		c.Writer.Header().Set("Access-Control-Allow-Methods", "POST, OPTIONS")
		if c.Request.Method == "OPTIONS" {
			c.AbortWithStatus(204)
			return
		}
		c.Next()
	})

	// Routes
	r.POST("/query", handlers.ExecuteQuery)

	r.Run(":8080")
}

