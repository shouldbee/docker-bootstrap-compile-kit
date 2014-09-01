IMAGE := shouldbee/bootstrap-compile-kit

build:
	sudo docker build -t $(IMAGE) .
