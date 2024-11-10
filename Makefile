# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hshimizu <hshimizu@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/02 06:20:15 by hshimizu          #+#    #+#              #
#    Updated: 2024/11/02 06:20:18 by hshimizu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE	:= ./srcs/docker-compose.yml
VOLUME_DIR		:= ~/data

.PHONY: build up down restart logs ps clean re neko mount umount

build: $(COMPOSE_FILE)
	@docker compose -f $< build

up: $(COMPOSE_FILE) | $(VOLUME_DIR)
	@docker compose -f $< up -d

down: $(COMPOSE_FILE)
	@docker compose -f $< down

restart: $(COMPOSE_FILE)
	@docker compose -f $< restart

logs: $(COMPOSE_FILE)
	@docker compose -f $< logs

ps: $(COMPOSE_FILE)
	@docker compose -f $< ps

clean:
	@echo docker stop...
	@docker stop $(shell docker ps -qa) 2>/dev/null || true
	@echo docker rm...
	@docker rm $(shell docker ps -qa) 2>/dev/null || true
	@echo docker rmi...
	@docker rmi -f $(shell docker images -qa) 2>/dev/null || true
	@echo docker volume rm...
	@docker volume rm $(shell docker volume ls -q) 2>/dev/null || true
	@echo docker network rm...
	@docker network rm $(shell docker network ls -q) 2>/dev/null || true
	@sudo rm -rf $(VOLUME_DIR)

mount:
	@mkdir -p ~/share
	@sudo mount -t cifs //hshimizu.42.fr/share ~/share -o guest,uid=$(shell id -u),gid=$(shell id -g)

umount:
	@sudo umount ~/share

re: down clean build up

neko:
	@echo "🐈 ﾆｬｰﾝ"

$(VOLUME_DIR):
	@mkdir -p $@/database
	@mkdir -p $@/wordpress
	@mkdir -p $@/share
