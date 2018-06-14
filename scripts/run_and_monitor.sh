#!/usr/bin/env bash

sleep_secs=${1:-5}

# Start the program
CMD=sqlops
${CMD}

while [ 1 ]; do
  ps aux |grep ${CMD} |grep -q -v grep
  PROCESS_STATUS=$?
  # If the grep above find anything, it exits with 0 status
  # If it is not 0, then something is wrong
  if [ $PROCESS_STATUS -ne 0 ]; then
    echo "Sqlops has exited."
    exit 1
  fi
  sleep ${sleep_secs}
done
