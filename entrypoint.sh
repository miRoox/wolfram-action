#!/bin/sh -l

set -e

error() {
  echo "::error :: $1"
  exit 1
}

script_file="$1"

if [ -z "$script_file" ]; then
  error "Input 'script-file' is missing."
fi

if [ -z "$WOLFRAM_ID" ]; then
  error "Environment vaiable WOLFRAM_ID is missing."
fi

if [ -z "$WOLFRAM_PASSWORD" ]; then
  error "Environment vaiable WOLFRAM_PASSWORD is missing."
fi

/usr/bin/wolframscript -username $WOLFRAM_ID -password $WOLFRAM_PASSWORD -file $script_file
