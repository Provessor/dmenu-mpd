#!/bin/bash
# Colours from pywal
. "${HOME}/.cache/wal/colors.sh"

# Dmenu arguments for colours
# Change "System San Francisco Display-13" to your front in form "[full name]-[size]"
font="System San Francisco Display-12"

crossfade() {
  local crossfade=`echo -e "0\n5" | dmenu -i -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -fn "$font" -p "Crossfade"`
  mpc crossfade $crossfade
}

current() {
  # For a formatted current output
  #echo -e `mpc current -f "%track% - %title% - %artist% - %album%"` | dmenu -i -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -fn "$font" -p "Crossfade"

  echo -e `mpc current` | dmenu -i -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -fn "$font" -p "Crossfade"
}

seek() {
  local seek=`echo -e "[+-]\n[<HH:MM:SS>]\nor\n<[+-]0-100>%>" | dmenu -i -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -fn "$font" -p "Seek"`
  mpc seek "$seek"
}

search() {
  local artist=`mpc list albumartist | dmenu -i -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -fn "$font" -p "Artist"`
  local albumlist=`mpc list album artist "$artist"`

  local album=`echo -e "[ALL]\n$albumlist" | dmenu -i -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -fn "$font" -p "Album"`

  mpc clear
  if [[ $album == '[ALL]' ]];
  then
    mpc find artist "$artist" | mpc add
  else
    mpc find artist "$artist" album "$album" | mpc add
  fi

  mpc play
}

playlist() {
  local track=`mpc playlist -f "%position% - %title% - %artist% - %album%" | dmenu -i -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -fn "$font" -l 5 -p "Track"`
  mpc play "${track%% *}"
}

load() {
  local load=`mpc lsplaylists | dmenu -i -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -fn "$font" -l 5 -p "Track"`
  mpc clear
  mpc load "$load"
  mpc play
}

# Get user action
RESULT=`echo -e "Consume\nCrossfade\nCurrent\nNext\nPause\nPlay\nPrev\nRandom\nRepeat\nSingle\nSeek\nStop\nToggle\nClear\nSearch\nPlaylist\nLoad" | dmenu -i -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -fn "$font" -p "Music"`

case "$RESULT" in
  Consume) `mpc consume` ;;
  Crossfade) crossfade ;;
  Current) current ;;
  Next) `mpc next` ;;
  Pause) `mpc pause` ;;
  Play) `mpc play` ;;
  Prev) `mpc prev` ;;
  Random) `mpc random` ;;
  Repeat) `mpc repeat` ;;
  Single) `mpc single` ;;
  Seek) seek ;;
  Stop) `mpc stop` ;;
  Toggle) `mpc toggle` ;;
  Clear) `mpc clear` ;;
  Search) search ;;
  Playlist) playlist ;;
  Load) load ;;
esac
