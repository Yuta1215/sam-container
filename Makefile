DC := docker-compose

build-local:
	@${DC} build

up:
	@${DC} up -d

down:
	@${DC} down

ps:
	@${DC} ps

sam-login:
	@${DC} run sam /bin/sh

local-start-api:
	@${DC} run --service-ports sam sam local start-api --host 0.0.0.0 --debug-port 5858 --docker-volume-basedir "$(PWD)/src"
