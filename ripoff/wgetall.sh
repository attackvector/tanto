#!/bin/sh
# wgetall script
# (c) Thom Hastings 2012-2019 New BSD License || AGPL
# got sick and tired of googling "mp3 blogs and wget"
# TODO: allow multiple extension arguments (e.g. mp3,wav,flac)
if [[ "$1" == "" ]] ; then
  echo "Usage: ./wgetall.sh [EXT] [URL]     -- wgets all files of extension EXT from base URL."
  echo "e.g: ./wgetall.sh mp3 https://bootiemashup.com/best-of-bootie/"
  exit
fi
echo

echo "~\nTODO:\n <insert loop through multiple fileext's here>\n~"

echo
echo "Looks like you want to wget all files of extension: "$1
echo "From URL: "$2
echo
echo "If this is correct, wait 3 seconds and do nothing..."
echo
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
echo
wget -c -r -l1 -H -t1 -nd -N -np -A.$1 -erobots=off "$2"
echo
echo "w-got all .$1 from $2"
echo
echo "Done!"
