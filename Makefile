# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hshimizu <hshimizu@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/21 01:34:16 by hshimizu          #+#    #+#              #
#    Updated: 2024/10/27 03:56:40 by hshimizu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE	:= ./srcs/docker-compose.yml

.PHONY: build up down restart logs ps clean neko

build: $(COMPOSE_FILE)
	@docker compose -f $< build 

up: $(COMPOSE_FILE)
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
	@docker stop $(docker ps -qa) 2>/dev/null || true
	@echo docker rm...
	@docker rm $(docker ps -qa) 2>/dev/null || true
	@echo docker rmi...
	@docker rmi -f $(docker images -qa) 2>/dev/null || true
	@echo docker volume rm...
	@docker volume rm $(docker volume ls -q) 2>/dev/null || true
	@echo docker network rm...
	@docker network rm $(docker network ls -q) 2>/dev/null || true

neko:
	@echo "🐈 ﾆｬｰﾝ"
