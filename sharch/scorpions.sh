# !/bin/bash
echo >&2 "Meet the Scorpions!"
songs=("Wind of Change" "Rock You Like a Hurricane" "Still Loving You" "Send Me an Angel")
random_index=$((RANDOM % ${#songs[@]}))
echo "${songs[random_index]}"