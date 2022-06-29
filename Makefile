postgres:
	docker run --name postgres-test -p 49153:49153 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -d postgres:latest

createdb:
	docker exec -it postgres-test createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres-test dropdb database --username=root --owner=root simple_bank

migrateup:
	migrate -path db/migrate -database "postgresql://postgres:postgres@localhost:49153/cursogo?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migrate -database "postgresql://postgres:postgres@localhost:49153/cursogo?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb