package handlers

import (
	"encoding/json"
	"fmt"
	"net/http"

	"server/db"
	"server/models"
)

// QueryHandler executes SQL queries sent from frontend
func QueryHandler(w http.ResponseWriter, r *http.Request) {
	// CORS headers
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Set("Access-Control-Allow-Methods", "POST, OPTIONS")
	w.Header().Set("Access-Control-Allow-Headers", "Content-Type")
	if r.Method == http.MethodOptions {
		w.WriteHeader(http.StatusOK)
		return
	}

	if r.Method != http.MethodPost {
		http.Error(w, "Only POST allowed", http.StatusMethodNotAllowed)
		return
	}

	var req models.QueryRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, "Invalid JSON", http.StatusBadRequest)
		return
	}

	rows, err := db.DB.Query(req.SQL)
	if err != nil {
		http.Error(w, fmt.Sprintf("Query error: %v", err), http.StatusBadRequest)
		return
	}
	defer rows.Close()

	cols, _ := rows.Columns()
	results := []map[string]interface{}{}

	for rows.Next() {
		colsData := make([]interface{}, len(cols))
		colsPointers := make([]interface{}, len(cols))
		for i := range colsData {
			colsPointers[i] = &colsData[i]
		}
		rows.Scan(colsPointers...)

		rowMap := map[string]interface{}{}
		for i, colName := range cols {
			val := colsData[i]
			rowMap[colName] = val
		}
		results = append(results, rowMap)
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(results)
}

