#/**
# *　　　　 ┏┓　　 　┏┓+ +
# *　　　　┏┛┻━━━━━━━┛┻━━┓　 + +
# *　　　　┃　　　　　　 ┃ 　
# *　　　　┃━　　━　　 　┃ ++ + + +
# *　　　 ████━████      ┃+
# *　　　　┃　　　　　　 ┃ +
# *　　　　┃　┻　　　    ┃
# *　　　　┃　　　　　　 ┃ + +
# *　　　　┗━━━┓　　 　┏━┛
# *　　　　　　┃　　 　┃　　　　　　　　　　　
# *　　　　　　┃　　 　┃ + + + +
# *　　　　　　┃　　 　┃　　　　Code is far away from bug 
# *　　　　　　┃　　 　┃　　　　with the animal protecting　　　　　　　
# *　　　　　　┃　　 　┃
# *　　　　　　┃　　 　┃ + 　　　　神兽保佑,代码无bug　　
# *　　　　　　┃　　 　┃
# *　　　　　　┃　　 　┃　　+　　　　　　　　　
# *　　　　　　┃　 　　┗━━━━━━━┓ + +
# *　　　　　　┃ 　　　　　　　┣┓
# *　　　　　　┃ 　　　　　　　┏┛
# *　　　　　　┗━━┓┓┏━━━━━┳┓┏━━┛ + + + +
# *　　　　　　　 ┃┫┫　   ┃┫┫
# *　　　　　　　 ┗┻┛　   ┗┻┛+ + + +
# */

FROM alpine:3.4
MAINTAINER Jiangwen Su "uukuguy@gmail.com"

RUN apk update && apk add quagga

RUN mkdir -p /apps/docker-router
COPY run_quagga.sh /apps/docker-router/run_quagga.sh

WORKDIR '/apps/docker-router'
CMD './run_quagga.sh'


