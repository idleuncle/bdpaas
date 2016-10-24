FROM ubuntu:14.04

COPY ./sources.list.cn /etc/apt/sources.list

# Install dependancies
RUN DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]'); CODENAME=$(lsb_release -cs); echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | sudo tee /etc/apt/sources.list.d/mesosphere.list
RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF

RUN sudo apt-get -y update
RUN sudo apt-get -y install curl wget python-pip 
RUN sudo apt-get -y install mesos

WORKDIR /var/lib/mesos
ENTRYPOINT ["/usr/sbin/mesos-master"]

