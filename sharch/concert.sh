#! /bin/bash
echo >&2 "Our concert is about to start!"
scorpions_song=$($scorpions_call)
echo >&2 "Now playing: $scorpions_song"
killers_song=$($killers_call)
echo >&2 "Now playing: $killers_song"
echo >&2 "Thank you for coming!"
echo "$scorpions_song, $killers_song"