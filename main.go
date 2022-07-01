package main

import (
	"database/sql"
	"log"

	"github.com/M1racle-Heen/simplebank/api"
	db "github.com/M1racle-Heen/simplebank/db/sqlc"
	"github.com/M1racle-Heen/simplebank/util"
	_ "github.com/lib/pq"
)

func main() {
	config, err := util.LoadConfig(".")
	if err != nil {
		log.Fatal(err)
	}

	conn, err := sql.Open(config.DBDriver, config.DBSourse)
	if err != nil {
		log.Fatal("cannot connect to Db: ", err)
	}

	store := db.NewStore(conn)
	server := api.NewServer(store)

	err = server.Start(config.ServerAddress)
	if err != nil {
		log.Fatal("Cannot start server: ", err)
	}
}
