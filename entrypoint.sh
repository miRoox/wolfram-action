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

echo '$WOLFRAM_ID
$WOLFRAM_PASSWORD' | /usr/bin/wolframscript

/usr/bin/wolframscript -file $script_file
