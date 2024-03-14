#! /bin/bash

log() {
    RED='\033[0;31m'
    NC='\033[0m'
    echo "${RED}Logs:${NC}"
    echo >&2 $1
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