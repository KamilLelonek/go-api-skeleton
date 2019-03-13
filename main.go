package main

import (
	"log"

	"github.com/gin-gonic/gin"
	_ "github.com/gobuffalo/pop"
	"github.com/pkg/errors"

	"github.com/KamilLelonek/skeleton-api/healthcheck"
)

func main() {
	router := gin.Default()

	healthcheck.MountRoutes(router)

	if err := router.Run(); err != nil {
		log.Fatalln(errors.Wrap(err, "Cannot start server!"))
	}
}

