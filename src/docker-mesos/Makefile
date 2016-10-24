SERVICE_NAME=docker-mesos
IMAGE_NAME=uu/${SERVICE_NAME}

all: build

build:
	docker build -t ${IMAGE_NAME} .

push:
	registry_push_private_image.sh ${IMAGE_NAME}

package: clean
	tar cvf ${SERVICE_NAME}.tar README.md config start-master.sh start-slave.sh
	gzip ${SERVICE_NAME}.tar

clean:
	rm -f ${SERVICE_NAME}.tar.gz

