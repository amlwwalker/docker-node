# Base image is in https://registry.hub.docker.com/_/golang/
# Refer to https://blog.golang.org/docker for usage
FROM amlwwalker/beego
MAINTAINER Alex Walker amlwwalker@gmail.com


RUN apk add --update alpine-sdk
RUN apk add imagemagick-dev
RUN go get gopkg.in/gographics/imagick.v2/imagick
