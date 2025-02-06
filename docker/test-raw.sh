curl -sSL https://raw.githubusercontent.com/astorDev/nice-shell/main/.sh > ./x.sh && . ./x.sh && rm ./x.sh
sourcing ./.sh

export VERSION="$(uuidgen)"

docker build -t vosarat/versy-hello-docker:$VERSION --build-arg VERSION=$VERSION .
docker run vosarat/versy-hello-docker:$VERSION