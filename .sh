#! /bin/bash
LIGHT_CYAN='\033[1;36m'
RED='\033[31m'
NC='\033[0m'

log() {
    printf "${LIGHT_CYAN}${1}${NC}\n" >&2
}

throw() {
    printf "${RED}${1}. Exiting...${NC}\n" >&2 
    exit 1
}

ret() {
    printf %s "${1}"
    printf "\n" >&2
}

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
sourcing push_docker/

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