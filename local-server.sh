#!/bin/bash
# set -exo pipefail
# trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT

# requires:
# npm install -g livereloadx
# sudo apt install inotify-tools


livereloadx -s . &

while true; do
    inotifywait -e modify,create,delete -r ./blog/ && echo "rebuilding" && make -C blog/
done

# this kills the livereload server as well
kill -- -$$