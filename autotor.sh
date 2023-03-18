#!/bin/bash

usage() {
  echo "Usage: $0 <number of seconds>"
  echo "Restart the tor daemon using 'sudo service tor restart' after the specified number of seconds"
}

if [ $# -ne 1 ]; then
  usage
  exit 1
fi

if ! [[ "$1" =~ ^[0-9]+$ ]]; then
  echo "Error: argument must be a positive integer"
  usage
  exit 1
fi

while true; do
  echo "Restarting tor daemon in $1 seconds..."

  sleep $1

  echo "Restarting tor daemon now"
  sudo service tor restart
  echo "New public IP Address: $(proxychains -q curl -s https://checkip.amazonaws.com/)"
done
