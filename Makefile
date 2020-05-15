PKG=github.com/johnbellone/user-service
DATE?= $(shell date +%FT%T%z)
COMMIT?=$(shell git describe --tags --always --dirty)

all: build

proto:
	protoc -I/usr/local/include -I. -I./vendor \
	  -I./vendor/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
	  --grpc-gateway_out=logtostderr=true:. --micro_out=. --go_out=. \
	  protobuf/*.proto

deps:
	go get ./...

build: deps
	go build -tags release \
		-ldflags '-X $(PKG)/main.GitCommit=$(COMMIT) -X $(PKG)/main.BuildDate=$(DATE)' \
		-o bin/user-service \
		src/*.go
