dev-setup:

	$(shell (cd devops/development; find . -type f -name "*.example" -exec sh -c 'cp -n {} $$(basename {} .example)' \;))

	$(shell sudo docker network create sisgea-net 2>/dev/null)

dev-up:
	make dev-setup;
	sudo docker compose --file devops/development/docker-compose.yml -p sisgea-module-sso up -d  --build;

dev-shell:
	make dev-up;
	sudo docker compose --file devops/development/docker-compose.yml -p sisgea-module-sso exec sisgea-sso bash;

dev-down:
	sudo docker compose --file devops/development/docker-compose.yml -p sisgea-module-sso stop

dev-logs:
	sudo docker compose --file devops/development/docker-compose.yml -p sisgea-module-sso logs -f
