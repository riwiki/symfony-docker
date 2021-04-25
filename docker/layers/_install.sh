#!/usr/bin/env bash

set -e

enabled_layers=$(cat /dc.lock)

hooked_layers=db

layers="sort <(echo {$enabled_layers}) <(echo $hooked_layers) | uniq -d"
# fun fact: we need to run the eval separately, as it does not work in one command
layers=$(eval "$layers")
# FIXME the above is running fine locally but not inside the docker container
#       Workaround: defined it explicitly.
layers="db"

namespace=""
if [[ "$1" == "--dev" ]]; then
  namespace=".dev"
fi

for layer in $(eval echo "$layers"); do
  set -x
  "/layers/$layer$namespace.sh"
  set +x
done