#!/bin/bash

set -u

set_rectangle_config() {
    local gapTop=$1
    defaults write com.knollsoft.Rectangle screenEdgeGapTop -int "$gapTop"
    killall Rectangle 2>/dev/null || true
    open -a Rectangle
}

while true; do
  if system_profiler SPDisplaysDataType | grep -q 'AW3423DWF'; then
    set_rectangle_config 40
  else
    set_rectangle_config 0
  fi
  sleep 10
done
