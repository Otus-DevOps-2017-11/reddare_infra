#!/bin/sh

gcloud compute instances create reddit-app-full \
  --boot-disk-size=10GB \
  --image-family reddit-full \
  --machine-type=g1-small \
  --tags puma \
  --restart-on-failure
