#! /bin/bash

log() {
    echo >&2 "\e[1;34m$1\e[0m"
}

throw() {
    echo >&2 $1
    exit 1
}

ret() {
    echo $1
}

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

sourcing suffix/
sourcing calver/
sourcing nuget/

calver_nuget() {
    calver
    nuget
}

ACTION=${1}
echo "Executing action '$ACTION'"
$ACTION