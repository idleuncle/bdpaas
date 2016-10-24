FROM openjdk:8-jre-alpine
MAINTAINER Jiangwen Su "uukuguy@gmail.com"

ARG MIRROR=http://apache.mirrors.pair.com
ARG VERSION=3.4.8

LABEL name="zookeeper" version=$VERSION

RUN apk add --no-cache wget bash \
    && mkdir -p /opt \
    && wget -q -O - $MIRROR/zookeeper/zookeeper-$VERSION/zookeeper-$VERSION.tar.gz | tar -xzf - -C /opt \
    && mv /opt/zookeeper-$VERSION /opt/zookeeper \
    && cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg \
    && mkdir -p /var/lib/zookeeper

COPY ./config_files/opt/zookeeper/conf/zoo.cfg /opt/zookeeper/conf/zoo.cfg
COPY ./config_files/opt/zookeeper/bin/zookeeper-entrypoint.sh /opt/zookeeper/bin/zookeeper-entrypoint.sh
RUN chmod +x /opt/zookeeper/bin/zookeeper-entrypoint.sh

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

VOLUME ["/opt/zookeeper/conf", "/var/lib/zookeeper"]

ENTRYPOINT ["/opt/zookeeper/bin/zookeeper-entrypoint.sh"]
