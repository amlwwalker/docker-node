FROM golang:latest
MAINTAINER Alex Walker amlwwalker@gmail.com

RUN apt-get update && \
    apt-get install -qy \
        pkg-config \
        libmagickcore-dev \
        libmagickwand-dev \
        imagemagick \
        git \
        g++ \
        bzr \

    #clear up
    && apt-get autoremove && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN go get gopkg.in/gographics/imagick.v2/imagick
RUN go get github.com/astaxie/beego
RUN go get github.com/beego/bee
RUN go get github.com/tools/godep 

