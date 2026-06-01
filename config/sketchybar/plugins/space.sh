#!/bin/sh

# Load all defined colors
source "$CONFIG_DIR/colors.sh"

# Reset all spaces
SPACE_SIDS=(1 2 3 4 5 6 7 8 9 10)
for sid in "${SPACE_SIDS[@]}"
do
    sketchybar --set space.$sid     \
        background.drawing=off      \
        background.color=$NIGHT3    \
        label.color=$NIGHT1         \
        icon.color=$NIGHT1
done

# Highlight the selected space
if [ "$SELECTED" = true ]; then
    sketchybar --set $NAME          \
        background.drawing=on       \
        background.color=$FROST2    \
        label.color=$NIGHT1         \
        icon.color=$NIGHT1
fi

