all:
	@mkdir -p /home/${USER}/data/db
	@mkdir -p /home/${USER}/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml up -d

build:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

clean: down
	@docker system prune -a
	@rm -rf /home/${USER}/data/db
	@rm -rf /home/${USER}/data/wordpress

fclean:
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@rm -rf /home/${USER}/data/db
	@rm -rf /home/${USER}/data/wordpress

.PHONY	: all build down re clean fclean