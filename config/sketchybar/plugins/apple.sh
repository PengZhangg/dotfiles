#!/bin/bash

POPUP_OFF='sketchybar --set logo popup.drawing=off'

logo=(
  icon=􀣺
  background.color=$FROST1
  icon.color=$NIGHT1
  icon.font="SF Pro:Semibold:15.0"
  label.drawing=off
  label.align=center
  icon.align=center
  icon.padding_right=11
  popup.align=left
  click_script="sketchybar --set logo popup.drawing=toggle"
  --subscribe logo mouse.exited
                   mouse.exited.global
)

logo_about=(
  icon=􀅴
  label="About This Mac"
  click_script="open x-apple.systempreferences:com.apple.SystemProfiler.AboutExtension; $POPUP_OFF"
  "${separator[@]}"
)

logo_settings=(
  icon=􀍟
  label="System Settings"
  click_script="open -a 'System Settings'; $POPUP_OFF"
)

logo_sleep=(
  icon=􀜚
  label="Sleep"
  click_script="pmset sleepnow; $POPUP_OFF"
)

logo_restart=(
  icon=􀣨
  label="Restart…"
  click_script="osascript -e 'tell app \"loginwindow\" to «event aevtrrst»'; $POPUP_OFF"
)

logo_shutdown=(
  icon=􀷃
  label="Shut Down…"
  click_script="osascript -e 'tell app \"loginwindow\" to «event aevtrsdn»'; $POPUP_OFF"
)

logo_lockscreen=(
  icon=􀼑
  label="Lock Screen    􀆍􀆔Q"
  click_script="osascript -e 'tell application \"System Events\" to keystroke \"q\" using {command down,control down}'; $POPUP_OFF"
)

logo_logout=(
  icon=􀉭
  label="Log Out ${USER}… 􀆝􀆔Q"
  click_script="osascript -e 'tell app \"System Events\" to log out'; $POPUP_OFF"
  "${separator[@]}"
)

logo_refresh=(
  icon=􀅈
  label="Refresh Sketchybar"
  click_script="$POPUP_OFF; sketchybar --update"
)

