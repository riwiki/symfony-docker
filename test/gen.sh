#!/usr/bin/env bash

# Feasibility test for merging many docker-compose files.
# Results depend on the yaml complexity.

echo "
services:
  app-x:
    image: test-x
    environment:
      - SOME_ENTRY=a
      - ANOTHER_ENTRY=aaaa-x
    ports:
      - 1001:100x
" > docker-compose.yml

cmd="docker-compose"

for i in {1..100}; do
  cp docker-compose.yml "docker-compose.$i.yml"
  # note https://stackoverflow.com/a/62309999/1242922
  sed -i '' "s/x/$i/" "docker-compose.$i.yml"
  cmd="$cmd -f docker-compose.$i.yml"
done

echo 'Generated test data! Now calling docker-compose ...'

microtime() {
    python -c 'import time; print time.time()'
}

# measure the time: https://unix.stackexchange.com/a/12069
START=$(microtime)
$cmd config
END=$(microtime)
DIFF=$(echo "$END - $START" | bc)
echo "$DIFF"

# stats for MINIMAL DOCKER-COMPOSE WITH SERVICE IMAGE ONLY:
# for 1: .37
# for 10: .41
# for 100: .79
# for 200: 1.64
# for 300: 2.88
# for 400: 4.31
# for 500: 6.14

# stats for above docker-compose:
# for 100: 0.91
# for 500: 7.41

# It certainly depend on the yaml complexity



rm docker-compose.*