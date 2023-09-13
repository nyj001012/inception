UP=docker compose up
DOWN=docker compose down
IMAGE=docker compose image

all:
	docker compose -f srcs/docker-compose.yml up

clean:
	docker compose -f srcs/docker-compose.yml stop

fclean:
	docker compose -f srcs/docker-compose.yml down -v;
	docker rm $(docker ps -aq);
	docker rmi $(docker images -q);
