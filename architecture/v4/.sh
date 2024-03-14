sourcing() {
    if [ "$SOURCING_URL" = "" ]; then
        echo "Sourcing ./$1.sh by relative path"
        . ./$1.sh
    else
        echo "Sourcing $SOURCING_URL/$1.sh"
        curl -sSL "$SOURCING_URL/$1.sh" > ./x.sh
        . ./x.sh
    fi
}

sourcing suffix
sourcing calver

ACTION=$1
echo >&2 "Executing action '$ACTION'"
$ACTION
