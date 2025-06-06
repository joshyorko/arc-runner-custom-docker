#!/bin/bash

create_ghcr_secret() {
    local output_file="ghcr-login-secret.yaml"
    echo -e "${GREEN}🔐 Creating GitHub Container Registry secret YAML...${NC}"

    read -p "Enter the Kubernetes namespace for the secret: " namespace
    read -s -p "Enter the token for the docker-password: " token
    echo

    kubectl create secret docker-registry ghcr-login \
        --docker-server=ghcr.io \
        --docker-username="joshyorko" \
        --docker-password="$token" \
        --docker-email=joshua.yorko@gmail.com \
        --namespace="$namespace" \
        --dry-run=client -o yaml > "$output_file"

    echo -e "${GREEN}🔐 GitHub Container Registry secret YAML file created: $output_file${NC}"
}

# Main script execution
main() {
        echo -e "${GREEN}👋 Welcome to the Kubernetes setup script!${NC}"

        create_ghcr_secret

}

main
