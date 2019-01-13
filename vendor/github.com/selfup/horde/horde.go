// Package horde is an attempt at behaving like erlang for distributed systems.
//
// Lok'tar!
package horde

import (
	"net/http"
	"os"
	"os/signal"
)

// Boot starts up the Horde and returns the horde Manager
func Boot() *Manager {
	manager := new(Manager)

	go func() {
		stop := make(chan os.Signal, 1)
		signal.Notify(stop, os.Interrupt)

		manager.RemoveSelfFromHorde(stop)

		http.HandleFunc("/horde", managerHandler(manager))
		http.ListenAndServe(":9742", nil)
	}()

	return manager
}

// managerHandler is the http interface to the horde
func managerHandler(manager *Manager) func(w http.ResponseWriter, r *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Horde is listening!"))
	}
}
