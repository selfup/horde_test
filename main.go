package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/selfup/horde"
)

func main() {
	manager := horde.Boot()

	ping := manager.Ping()

	fmt.Println(ping)

	log.Fatal(http.ListenAndServe(":8080", nil))
}
