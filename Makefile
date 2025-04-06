include .env

CONTAINER=dockpress_wordpress
THEME_PATH=wp/wp-content/themes/$(THEME_NAME)

up:
	docker-compose up -d --build

down:
	docker-compose down

logs:
	docker-compose logs -f

bash:
	docker exec -it $(CONTAINER) bash

install-wp:
	docker exec -it $(CONTAINER) wp core install \
		--url=$(WP_URL) \
		--title="$(PROJECT_NAME)" \
		--admin_user=$(ADMIN_USER) \
		--admin_password=$(ADMIN_PASS) \
		--admin_email=$(ADMIN_EMAIL) \
		--allow-root

activate-theme:
	docker exec -it $(CONTAINER) wp theme activate $(THEME_NAME) --allow-root

composer-install:
	docker exec -it $(CONTAINER) bash -c "cd $(THEME_PATH) && composer install"

npm-install:
	docker exec -it $(CONTAINER) bash -c "cd $(THEME_PATH) && npm install"

npm-dev:
	docker exec -it $(CONTAINER) bash -c "cd $(THEME_PATH) && npm run dev"

npm-build:
	docker exec -it $(CONTAINER) bash -c "cd $(THEME_PATH) && npm run build"
