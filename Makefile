# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hshimizu <hshimizu@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/21 01:34:16 by hshimizu          #+#    #+#              #
#    Updated: 2024/10/20 05:15:03 by hshimizu         ###   ########.fr        #
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
