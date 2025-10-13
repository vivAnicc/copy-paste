#!/usr/bin/env fish

if test (count $argv) != 1
  echo "Usage: $(status filename) <file>" 1>&2
  exit 1
end

set -l filename $argv[1]

mkdir -p ~/.copy
if test "$(ls ~/.copy)" != ""
  rm -rf ~/.copy/*
end

cp $filename ~/.copy
