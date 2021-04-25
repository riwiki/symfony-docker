#!/bin/bash

# This script replaces the docker-compose and helps to keep the
# .yml files together.

set -e

layers=$(cat dc.lock)

compose_files=""
for layer in $(eval echo "{$layers}"); do
  compose_files="$compose_files -f docker-compose.$layer.yml"
done

command="docker-compose -f docker-compose.yml $compose_files"

if [[ "$1" == "dc:debug" ]]; then
  echo "$command"
  exit;
elif [[ "$1" == "dc:layers" ]]; then
  echo "$layers"
  exit;
fi

$command "$@"