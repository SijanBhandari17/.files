#!/bin/bash
wallpaper_path="/home/heisenberg/Downloads/wallpaper" 
mapfile -t wallpaper_list < <(find $wallpaper_path -type f)

#selecting a random element 
random_index=$(( $RANDOM % ${#wallpaper_list[@]} ))

feh --bg-scale ${wallpaper_list[$random_index]}

