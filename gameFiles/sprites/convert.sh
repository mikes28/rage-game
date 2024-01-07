#!/bin/bash

function iterate() {
  local dir="$1"

  for file in "$dir"/*; do
    if [ -f "$file" ]; then
      #echo "$file"
      name=${file%.psd}
      convert "$name.psd[0]" -scale XxY "$name.png"
    fi

    if [ -d "$file" ]; then
      iterate "$file"
    fi
  done
}

iterate "."
