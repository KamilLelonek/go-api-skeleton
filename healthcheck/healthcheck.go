package healthcheck

import "github.com/gin-gonic/gin"

func MountRoutes(router *gin.Engine)  {
	router.GET("/healthcheck", healthCheck)
}

func healthCheck(context *gin.Context) {
	context.JSON(200, gin.H{"status": "UP"})
}
