#! /bin/bash
# . /dev/stdin <<< "$(curl -sS https://raw.githubusercontent.com/astorDev/nice-shell/main/.sh)"

source_remote() {
    curl -sSL $1 > ./x.sh
    . ./x.sh
    rm ./x.sh

    # curl -sSL https://raw.githubusercontent.com/astorDev/nice-shell/main/.sh > ./x.sh && . ./x.sh && rm ./x.sh


    # . <(curl -sS https://raw.githubusercontent.com/astorDev/nice-shell/main/.sh)

}

source_remote https://raw.githubusercontent.com/astorDev/nice-shell/main/.sh
log "Sourced nice-shell"

sourcing() {
    if [ "$SOURCING_URL" = "" ]; then
        log "Sourcing ./$1.sh by relative path"
        . ./$1.sh
    else
        log "Sourcing $SOURCING_URL/$1.sh"
        curl -sSL "$SOURCING_URL/$1.sh" > ./x.sh
        . ./x.sh
        rm ./x.sh
    fi
}

sourcing suffix/
sourcing calver/
sourcing nuget/
sourcing docker/

calver_nuget() {
    calver
    nuget
}

calver_docker() {
    calver
    push_docker
}

ACTION=${1}
log "Executing action '$ACTION'"
$ACTION