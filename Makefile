# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hshimizu <hshimizu@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/21 01:34:16 by hshimizu          #+#    #+#              #
#    Updated: 2024/10/20 05:20:42 by hshimizu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY: build up down restart logs ps

build:
	docker compose build

up:
	docker compose up -d

down:
	docker compose down

restart:
	docker compose restart

logs:
	docker compose logs

ps:
	docker compose ps

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
  