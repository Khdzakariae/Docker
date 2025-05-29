


delete :
	docker stop nginx-container
	docker rm nginx-container
run:
	docker-compose -f srcs/docker-compose.yml up --build -d


