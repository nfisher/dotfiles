package main

import (
	"fmt"
	"os"
	"path/filepath"

	yaml "gopkg.in/yaml.v3"
)

type KubeConfig struct {
	CurrentContext string `yaml:"current-context"`
}

func main() {
	homeDir, err := os.UserHomeDir()
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error getting user home directory: %v\n", err)
		os.Exit(1)
	}

	configPath := filepath.Join(homeDir, ".kube", "config")

	yamlData, err := os.ReadFile(configPath)
	if err != nil {
		if os.IsNotExist(err) {
			fmt.Fprintf(os.Stderr, "Error: Kubernetes config file not found at %s\n", configPath)
		} else {
			fmt.Fprintf(os.Stderr, "Error reading config file %s: %v\n", configPath, err)
		}
		os.Exit(1)
	}

	var config KubeConfig

	err = yaml.Unmarshal(yamlData, &config)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error parsing YAML config file %s: %v\n", configPath, err)
		os.Exit(1)
	}

	if config.CurrentContext == "" {
		fmt.Fprintf(os.Stderr, "Error: 'current-context' field not found or is empty in %s\n", configPath)
		os.Exit(1)
	}

	fmt.Println(config.CurrentContext)
}
