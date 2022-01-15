package main

import (
	"fmt"
	"net/http"
	"os/exec"
)

func installChart(w http.ResponseWriter, r *http.Request) {
	cmd := exec.Command("./scripts/package_install_chart.sh")
	output, err := cmd.CombinedOutput()
	if err != nil {
		fmt.Fprintln(w, err)
	} else {
		fmt.Fprintln(w, string(output))
	}
}

func buildAndPushImage(w http.ResponseWriter, r *http.Request) {
	cmd := exec.Command("./scripts/build_push_image.sh")
	output, err := cmd.CombinedOutput()
	if err != nil {
		fmt.Fprintln(w, err)
	} else {
		fmt.Fprintln(w, string(output))
	}
}

func deploy(w http.ResponseWriter, r *http.Request) {
	buildAndPushImage(w, r)
	installChart(w, r)
}

func main() {
	http.HandleFunc("/package-install-chart", installChart)
	http.HandleFunc("/build-push-image", buildAndPushImage)
	http.HandleFunc("/deploy", deploy)

	if err := http.ListenAndServe(":8888", nil); err != nil {
		fmt.Println(err)
	}
}
