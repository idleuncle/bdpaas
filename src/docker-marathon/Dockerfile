FROM uu/docker-mesos:latest

#RUN mkdir -p /var/lib/marathon && \
    #wget http://downloads.mesosphere.com/marathon/v1.1.1/marathon-1.1.1.tgz && \
    #tar zxvf marathon-1.1.1.tgz -C /var/lib/marathon --strip=1
RUN apt-get install marathon

EXPOSE 8080
WORKDIR /var/lib/marathon
ENTRYPOINT ["/var/lib/marathon/bin/start"]

