# Base image is in https://registry.hub.docker.com/_/golang/
# Refer to https://blog.golang.org/docker for usage
FROM golang:1.7-alpine
MAINTAINER Alex Walker amlwwalker@gmail.com

RUN apk update && apk add git && apk add g++ && apk add bzr && \
    rm -rf /var/cache/apk/*
# ENV GOPATH /go

# Install beego & bee
RUN go get github.com/astaxie/beego
RUN go get github.com/beego/bee
RUN go get gopkg.in/mgo.v2
RUN go get gopkg.in/mgo.v2/bson
RUN go get github.com/weppos/publicsuffix-go/publicsuffix
RUN go get github.com/Abramovic/fullcontact-go
RUN go get github.com/mvdan/xurls
