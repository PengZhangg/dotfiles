#!/bin/bash

sketchybar --add item media right \
           --set media label.color=$NIGHT3 \
                       label.max_chars=20 \
                       icon.padding_left=0 \
                       scroll_texts=on \
                       icon=􀑪             \
                       icon.color=$NIGHT3   \
                       background.color=$AURORA1\
                       background.corner_radius=5 \
                       background.height=24 \
                       padding_right=5\
                       label.padding_left=5\
                       label.padding_right=10\
                       icon.padding_left=10\
                       icon.padding_right=10\
                       script="$PLUGIN_DIR/media.sh" \
           --subscribe media media_change
