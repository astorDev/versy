# !/bin/bash
echo >&2 "Meet the Killers!"
songs=("Mr. Brightside" "Somebody Told Me" "When You Were Young" "Human")
random_index=$((RANDOM % ${#songs[@]}))
echo "${songs[random_index]}"