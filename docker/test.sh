curl -sSL https://raw.githubusercontent.com/astorDev/nice-shell/main/.sh > ./x.sh && . ./x.sh && rm ./x.sh
source ./.sh

export VERSION="$(uuidgen)"
export IMAGE="vosarat/versy-hello-docker"

push_docker