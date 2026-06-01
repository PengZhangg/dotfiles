#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

VOLUME=$(osascript -e "output volume of (get volume settings)")

case $VOLUME in
  [6-9][0-9]|100) ICON="􀊩"
  ;;
  [3-5][0-9]) ICON="􀊥"
  ;;
  [1-9]|[1-2][0-9]) ICON="􀊡"
  ;;
  0) ICON="􀊣"
  ;;
esac

sketchybar --set volume icon="$ICON" label="$VOLUME%"

