NAME=inception
COMPOSE_PATH=./srcs/docker-compose.yml

all: $(NAME)


$(NAME):
	echo -e "* make image and upload containers"; \
	docker compose -p $(NAME) -f $(COMPOSE_PATH) up -d && \
	echo -e "* \033[0;32mCOMPLETE\033[0m uploading. you can check with 'docker ps'."

clean:
	docker compose -f $(COMPOSE_PATH) stop


fclean:
	@docker compose down -v --rmi all; \
	@docker rm -f $(docker ps -aq) 2> /dev/null; \
	@docker rmi $(docker images -q) 2> /dev/null; \
	echo -e "* all files has \033[0;31mDELETED\033[0m."

re: fclean all

.PHONY: all clean fclean re
