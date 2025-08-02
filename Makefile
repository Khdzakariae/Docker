
DOCKER_COMPOSE=docker compose

DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

build:
	mkdir -p /Users/zel-khad/data/database
	mkdir -p /Users/zel-khad/data/web
	mkdir -p /Users/zel-khad/data/logs
	@$(DOCKER_COMPOSE)  -f $(DOCKER_COMPOSE_FILE) up --build -d

kill:
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) kill

down:
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

clean:
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down -v

fclean: clean
	rm -rf /Users/zel-khad/data/database
	rm -rf /Users/zel-khad/data/web
	rm -rf /Users/zel-khad/data/logs
	docker system prune -a -f

restart: clean build

.PHONY: kill build down clean restart