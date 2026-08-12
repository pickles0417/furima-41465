.PHONY: up build down restart logs ps console test migrate setup

up:
	docker compose up -d

build:
	docker compose up -d --build

down:
	docker compose down

restart:
	docker compose restart web

logs:
	docker compose logs -f web

ps:
	docker compose ps

console:
	docker compose exec web bin/rails console

test:
	docker compose exec -e RAILS_ENV=test web bin/rails db:prepare
	docker compose exec -e RAILS_ENV=test web bundle exec rspec

migrate:
	docker compose exec web bin/rails db:migrate

setup:
	cp -n .env.example .env || true
	docker compose up -d --build
