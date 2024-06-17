#!/bin/bash

sketchybar --add item cpu right                 \
           --set cpu  update_freq=2             \
                      icon=􀧓                    \
                      background.color=$AURORA2 \
                      script="$PLUGIN_DIR/cpu.sh"
