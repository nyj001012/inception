NAME=build

all:
	echo -e "* creating ssl key and certificate"; \
	sh ./srcs/requirements/nginx/tools/script.sh 1> /dev/null; \
	echo -e "* make image and upload containers"; \
	docker compose -f ./srcs/docker-compose.yml up -d && \
	echo -e "* \033[0;32mCOMPLETE\033[0m uploading. you can check with 'docker ps'."

$(NAME): all

clean:
	docker compose -f ./srcs/docker-compose.yml stop

fclean:
	@docker rm -f $(docker ps -aq) 2> /dev/null; \
	@docker rmi $(docker images -q) 2> /dev/null; \
	echo -e "* all files has \033[0;31mDELETED\033[0m."
