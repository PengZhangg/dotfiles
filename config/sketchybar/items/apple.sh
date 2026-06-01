#!/bin/bash

source "$PLUGIN_DIR/apple.sh"

# Define the common settings
common_settings=(
	label.color="$STORM1"
	icon.color="$STORM1"
)

sketchybar                                                                    	\
	--add item logo left                                                       	\
	--set logo "${logo[@]}" "${common_settings[@]}"                            	\
																				\
	--add item logo.about popup.logo                                            \
	--set      logo.about "${logo_about[@]}" "${common_settings[@]}"            \
																				\
	--add item logo.settings popup.logo                 						\
	--set      logo.settings "${logo_settings[@]}" "${common_settings[@]}" 	   	\
																				\
	--add item logo.sleep popup.logo                    						\
	--set      logo.sleep "${logo_sleep[@]}" "${common_settings[@]}" 			\
																				\
	--add item logo.restart popup.logo                 							\
	--set      logo.restart "${logo_restart[@]}" "${common_settings[@]}" 		\
																				\
	--add item logo.shut_down popup.logo                						\
	--set      logo.shut_down "${logo_shutdown[@]}" "${common_settings[@]}" 	\
																				\
	--add item logo.lock_screen popup.logo              						\
	--set      logo.lock_screen "${logo_lockscreen[@]}" "${common_settings[@]}" \
																				\
	--add item logo.logout popup.logo                   						\
	--set      logo.logout "${logo_logout[@]}" "${common_settings[@]}" 			\
																				\
	--add item logo.refresh popup.logo                  						\
	--set      logo.refresh "${logo_refresh[@]}" "${common_settings[@]}"
