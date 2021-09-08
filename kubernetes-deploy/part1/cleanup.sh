#!/usr/bin/env bash

# fail fast
set -e

echo "Removing CloudTruth kubernetes operator"
helm delete --namespace ctdeploytest kubetruth
kubectl delete customresourcedefinition projectmappings.kubetruth.cloudtruth.com
kubectl delete namespace ctdeploytest
