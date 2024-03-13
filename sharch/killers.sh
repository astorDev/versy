# !/bin/bash
echo >&2 "Meet the Killers!"

random_index=$((RANDOM % 4))

case $random_index in
    0)
        echo "Mr. Brightside"
        ;;
    1)
        echo "Somebody Told Me"
        ;;
    2)
        echo "When You Were Young"
        ;;
    3)
        echo "Human"
        ;;
    *)
        echo "Unknown song"
        ;;
esac