#!/usr/bin/env fish

if test (count $argv) != 1
  echo "Usage: $(status filename) <file>" 1>&2
  exit 1
end

set -l dirname $argv[1]

if test "$(ls ~/.copy)" = ""
  echo "Error: copy a file first!" 1>&2
  exit 1
end

mkdir -p $dirname
cp -r ~/.copy/* $dirname
