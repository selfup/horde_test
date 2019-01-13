# Horde

Masterless node tracker.

### What is this for?

To have nodes talk to eachother and be aware of eachother in realtime :rocket:

Think EPMD in erlang as a library for your go web apps :tada:

### TODO

All of it :pray:

### Example (very early API)

```go
package main

import (
	"fmt"
	"net/http"

	"github.com/selfup/horde"
)

func main() {
	hordeManager := horde.Boot()

	res := hordeManager.Ping()

	fmt.Println(res)

	http.ListenAndServe(":8080", nil)
}

```
