package main

import (
	"time"

	"github.com/micro/go-micro/v2"
	log "github.com/micro/go-micro/v2/logger"

	pb "github.com/johnbellone/user-service/api"
)

// Version The main, base version of the project.
const Version = "0.1.0"

// GitCommit The git commit of the build; this is set by the compiler.
var GitCommit string

// GitCommit The git commit of the build; this is set by the compiler.
var BuildDate string

func main() {
	service := micro.NewService(
		micro.Name("user-service"),
		micro.Version(Version),
		micro.RegisterTTL(time.Second*10),
		micro.RegisterInterval(time.Second*10),
	)

	service.Init()
	pb.RegisterUsersHandler(service.Server(), new(UsersHandler))

	if err := service.Run(); err != nil {
		log.Fatal(err)
	}
}
