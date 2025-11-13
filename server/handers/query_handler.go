package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"react-go-sql/backend/db"
)

type QueryRequest struct {
	SQL string `json:"sql"`
}

func ExecuteQuery(c *gin.Context) {
	var req QueryRequest
	if err := c.BindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	rows, err := db.DB.Query(req.SQL)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	defer rows.Close()

	cols, _ := rows.Columns()
	results := []map[string]interface{}{}

	for rows.Next() {
		columns := make([]interface{}, len(cols))
		columnPointers := make([]interface{}, len(cols))
		for i := range columns {
			columnPointers[i] = &columns[i]
		}
		if err := rows.Scan(columnPointers...); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		rowMap := make(map[string]interface{})
		for i, col := range cols {
			val := columnPointers[i].(*interface{})
			rowMap[col] = *val
		}
		results = append(results, rowMap)
	}

	c.JSON(http.StatusOK, results)
}
