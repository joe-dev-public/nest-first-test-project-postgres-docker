CONTAINER_NAME=nest-first-test-project-postgres-container
IMAGE_NAME=nest-first-test-project-postgres-image

build:
	docker build -t $(IMAGE_NAME) .

# Use a volume for data persistence for now
up:
	docker run --name $(CONTAINER_NAME) --mount type=volume,src=$(IMAGE_NAME)-volume,target=/var/lib/postgresql/data --network some-network --network-alias postgres-server -e POSTGRES_PASSWORD=password -d $(IMAGE_NAME)

down:
	docker rm -f $(CONTAINER_NAME)

# Todo: make default user postgres for this?
bash:
	docker exec -it $(CONTAINER_NAME) bash
