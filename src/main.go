package main

import (
	"time"

	"github.com/micro/go-micro/v2"
	log "github.com/micro/go-micro/v2/logger"
)

func main() {
	service := micro.NewService(
		micro.Name("user-service"),
		micro.Version(Version),
	)

	service.Init()

	if err := service.Run(); err != nil {
		log.Fatal(err)
	}
}
