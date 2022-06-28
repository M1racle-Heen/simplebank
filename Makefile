postgres:
	docker run --name postgres14.4 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:14.4-alpine

createdb:
	docker exec -it postgres14.4 createdb --username=root --owner=root simplebank

dropdb:
	docker exec -it postgres14.4 dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simplebank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simplebank?sslmode=disable" -verbose down

sqlc:
	docker run --rm -v "$(CURDIR):/src" -w //src kjconroy/sqlc generate



test:
	go test -v -cover ./...



.PHONY: postgres createdb dropdb migrateup migratedown sqlc test