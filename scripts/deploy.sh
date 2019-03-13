#!/usr/bin/env bash
set -e

gcloud app deploy \
  --quiet \
  --project ${TF_PROJECT:-$@}
