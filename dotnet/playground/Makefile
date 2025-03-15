play:
	dotnet run & \
	sleep 3 && \
	$(MAKE) yac
	$(MAKE) stop

stop:
	lsof -t -i:5242 | xargs kill

up:
	docker-compose up -d --build

down:
	docker-compose down

up-play:
	$(MAKE) up
	$(MAKE) yac
	$(MAKE) down

yac:
	httpyac send .http --all