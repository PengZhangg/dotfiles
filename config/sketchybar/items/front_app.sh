#!/bin/bash

sketchybar --add item front_app left \
           --set front_app       background.color=$FROST3 \
                                 icon.color=$NIGHT1 \
                                 icon.font="sketchybar-app-font:Regular:16.0" \
                                 label.color=$NIGHT1 \
                                 script="$PLUGIN_DIR/front_app.sh"            \
           --subscribe front_app front_app_switched
