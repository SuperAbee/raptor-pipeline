package main

import (
	"fmt"
	"net/http"
	"os/exec"
)

func installChart(w http.ResponseWriter, r *http.Request) {
	cmd := exec.Command("./scripts/install_chart.sh")
	err := cmd.Run()
	fmt.Fprintln(w, err)
}

func main() {
	http.HandleFunc("/install-chart", installChart)
	http.ListenAndServe(":8888", nil)
}
