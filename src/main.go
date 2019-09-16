package main

import (
	"fmt"
	"log"
	"net/http"
	"math"
)

func greeting(message string) string {

	var x = 0.0010;

	for i := 0; i < 1000000; i++ {
	    x += math.Sqrt(x)
	}

    return fmt.Sprintf("<b>%s</b>", message)
}

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, greeting("Code.education Rocks!") )
}

func main() {
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":80", nil))
}
