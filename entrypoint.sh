#!/bin/sh -l

set -e

error() {
  echo "::error :: $1"
  exit 1
}

script_file="$1"
script_args=$2

if [ -z "$script_file" ]; then
  error "Input 'file' is missing."
fi

if [ -z "$WOLFRAM_ID" ]; then
  error "Environment vaiable WOLFRAM_ID is missing."
fi

if [ -z "$WOLFRAM_PASS" ]; then
  error "Environment vaiable WOLFRAM_PASS is missing."
fi

/usr/bin/wolframscript -authenticate $WOLFRAM_ID $WOLFRAM_PASS
/usr/bin/wolframscript -activate

if [ ! -f "$script_file" ]; then
  error "File '$script_file' cannot be found from the directory '$PWD'."
fi

/usr/bin/wolframscript -file $script_file $script_args
