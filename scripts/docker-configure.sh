#!/usr/bin/env bash
set -e

gcloud --quiet auth activate-service-account --key-file=<(echo $GCLOUD_SERVICE_KEY)
gcloud --quiet auth configure-docker
