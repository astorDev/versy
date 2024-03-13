# !/bin/bash
echo >&2 "Meet the Scorpions!"

random_index=$((1 + RANDOM % 4))

case $random_index in
    1)
        echo "Wind of Change"
        ;;
    2)
        echo "Rock You Like a Hurricane"
        ;;
    3)
        echo "Still Loving You"
        ;;
    4)
        echo "Send Me an Angel"
        ;;
    *)
        echo "Unknown song"
        ;;
esac