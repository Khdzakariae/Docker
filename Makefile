


delete :
	docker stop nginx-container
	docker rm nginx-container
run:
	docker-compose -f srcs/docker-compose.yml up --build -d

retart :
	docker stop nginx-container || true
	docker rm nginx-container || true
	docker-compose -f srcs/docker-compose.yml up --build -d

re :
	docker-compose -f srcs/docker-compose.yml down
	docker-compose -f srcs/docker-compose.yml up --build -d

