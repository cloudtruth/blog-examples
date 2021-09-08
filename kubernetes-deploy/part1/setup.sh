#!/usr/bin/env bash

# fail fast
set -e

: "${CLOUDTRUTH_API_KEY:?Variable not set or empty}"

echo "Creating CloudTruth project"
cloudtruth projects set k8s-myapp-nginx

echo "Setting CloudTruth parameters"
cloudtruth --project k8s-myapp-nginx parameter set --value myapp app_name
cloudtruth --project k8s-myapp-nginx parameter set --value 80 app_port
cloudtruth --project k8s-myapp-nginx parameter set --value 80 service_port
cloudtruth --project k8s-myapp-nginx parameter set --value nginx image_name
cloudtruth --project k8s-myapp-nginx parameter set --value 1.20 image_version

echo "Creating CloudTruth templates"
cloudtruth --project k8s-myapp-nginx template set --body deployment.tmpl.yaml deployment
cloudtruth --project k8s-myapp-nginx template set --body service.tmpl.yaml service

echo "Installing CloudTruth kubernetes operator"
helm repo add cloudtruth https://packages.cloudtruth.com/charts/
helm install --create-namespace --namespace ctdeploytest --values ctdeploytest-values.yaml --set appSettings.apiKey=$CLOUDTRUTH_API_KEY kubetruth cloudtruth/kubetruth
