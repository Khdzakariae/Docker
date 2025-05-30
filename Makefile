


delete :
	docker-compose -f srcs/docker-compose.yml down
run:
	docker-compose -f srcs/docker-compose.yml up --build -d

retart :
	docker-compose -f srcs/docker-compose.yml down
	docker-compose -f srcs/docker-compose.yml up --build -d
