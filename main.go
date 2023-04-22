package main

import (
	"html/template"
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()

	// Load HTML templates
	router.SetHTMLTemplate(loadTemplates())

	router.GET("/", func(c *gin.Context) {
		c.HTML(http.StatusOK, "index.html", nil)
	})

	router.POST("/submit", func(c *gin.Context) {
		name := c.PostForm("name")
		c.HTML(http.StatusOK, "index.html", gin.H{"name": name})
	})

	router.Run(":8080")
}

func loadTemplates() *template.Template {
	templates := template.New("")
	templates, _ = templates.ParseGlob("views/*.html")
	return templates
}
