#!/bin/sh

BLANK='#000000'
CLEAR='#fecf4d'
DEFAULT='#ffffff'
TEXT='#eaeaea'
WRONG='#d23c3d'
VERIFYING='ffffff'

# i3lock color scheme
INSIDE_COLOR="373445"        # Dark purple-gray
RING_COLOR="ffffff"          # White
KEYHL_COLOR="d23c3d"         # Red (key highlight)
BSHL_COLOR="d23c3d"          # Red (backspace highlight)
SEPARATOR_COLOR="000000"     # Black
INSIDE_VER_COLOR="fecf4d"    # Yellow (verifying)
INSIDE_WRONG_COLOR="d23c3d"  # Red (wrong password)
RING_VER_COLOR="ffffff"      # White (verifying ring)
RING_WRONG_COLOR="ffffff"    # White (wrong password ring)

i3lock -n -i /home/heisenberg/Pictures/mahabharata_lock.png \
  --inside-color=$INSIDE_COLOR --ring-color=$RING_COLOR --line-uses-inside \
  --keyhl-color=$KEYHL_COLOR --bshl-color=$BSHL_COLOR --separator-color=$SEPARATOR_COLOR \
  --insidever-color=$INSIDE_VER_COLOR --insidewrong-color=$INSIDE_WRONG_COLOR \
  --ringver-color=$RING_VER_COLOR --ringwrong-color=$RING_WRONG_COLOR --ind-pos="x+86:y+1003" \
  --radius=15 --verif-text="" --wrong-text=""

