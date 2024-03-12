#! /bin/bash

source() {
    if [ "$SOURCING_URL" = "" ]; then
        echo "Sourcing ./$1.sh by relative path"
        . ./$1.sh
    else
        echo "Executing curl -sSL "$SOURCING_URL/$1.sh" > ./x.sh)"
        curl -sSL "$SOURCING_URL/$1.sh" > ./x.sh
        . ./x.sh
    fi
}

source suffix
source calver/
source nuget/

calver_nuget() {
    calver
    nuget
}

ACTION=${1}
echo "Executing action '$ACTION'"
$ACTION