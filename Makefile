NAME=inception
COMPOSE_PATH=./srcs/docker-compose.yml

all: $(NAME)


$(NAME):
	mkdir -p /home/yena/data/mysql
	mkdir -p /home/yena/data/wordpress
	echo -e "* make image and upload containers"; \
	docker compose -p $(NAME) -f $(COMPOSE_PATH) up -d && \
	echo -e "* \033[0;32mCOMPLETE\033[0m uploading. you can check with 'docker compose -p $(NAME) ps'."

clean:
	@docker compose -p $(NAME) -f $(COMPOSE_PATH) down -v --rmi all; \


fclean: clean
	sudo rm -rf /home/yena/data
	@docker rm -f $(docker ps -aq) 2> /dev/null; \
	@docker rmi $(docker images -q) 2> /dev/null; \
	docker system prune -a -f; \
	echo -e "* all files has \033[0;31mDELETED\033[0m."

re: fclean all

.PHONY: all clean fclean re
