PROJECT = inception_project
COMPOSE_FILE = ./srcs/docker-compose.yml
ENV_FILE = srcs/.env
DATA_DIR = ~/data
RM = rm -rf 
COMPOSE = docker-compose -f

all:
	@echo "*Initializing ${PROJECT} setup...*"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@${COMPOSE} ${COMPOSE_FILE} --env-file ${ENV_FILE} up -d

build:
	@echo "*Building ${PROJECT} environment...*"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@${COMPOSE} ${COMPOSE_FILE} --env-file ${ENV_FILE} up -d --build
	@docker volume create portainer_data
	@docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

down:
	@echo "*Shutting down ${PROJECT}...*"
	@${COMPOSE} ${COMPOSE_FILE} --env-file ${ENV_FILE} down

re: down
	@echo "* Rebuilding ${PROJECT}...*"
	@${COMPOSE} ${COMPOSE_FILE} --env-file ${ENV_FILE} up -d --build

clean: down
	@echo "* Removing ${PROJECT} data...*"
	@docker system prune -a
	@sudo ${RM} ${DATA_DIR}

fclean:
	@echo "* Performing complete clean-up...*"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo ${RM} ${DATA_DIR}
