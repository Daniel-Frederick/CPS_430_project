package main

import (
	"fmt"
	"log"
	"net/http"
	"server/db"
	"server/handlers"
)

func main() {
	// Initialize DB connection
	db.Init()
	defer db.DB.Close()

	// Initialize tables + dummy data
	db.InitializeTables()
	db.InsertDummyData()

	http.HandleFunc("/query", handlers.QueryHandler)

	fmt.Println("✅ Server running on http://localhost:8081")
	log.Fatal(http.ListenAndServe(":8081", nil))
}

