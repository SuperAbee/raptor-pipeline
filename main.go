package main

import (
	"fmt"
	"net/http"
	"os/exec"
)

func installChart(w http.ResponseWriter, r *http.Request) {
	cmd := exec.Command("./scripts/install_chart.sh")
	output, err := cmd.CombinedOutput()
	if err != nil {
		fmt.Fprintln(w, err)
	} else {
		fmt.Fprintln(w, string(output))
	}
}

func main() {
	http.HandleFunc("/install-chart", installChart)
	http.ListenAndServe(":8888", nil)
}
