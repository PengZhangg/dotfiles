# ~/.config/sketchybar/items/volume.sh

#!/bin/bash

sketchybar --add item volume right \
           --set volume script="~/.config/sketchybar/plugins/volume.sh" \
                                       background.color=$AURORA4 \
           --subscribe volume volume_change \
