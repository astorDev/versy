push_docker() {
    log "Building and publishing docker image (VERSION='$VERSION', IMAGE='$IMAGE', VERSY_DOCKERFILE_PATH='$VERSY_DOCKERFILE_PATH' DOCKER_LOGIN='$DOCKER_LOGIN')"

    if [ "$DOCKER_LOGIN" = "" ]; then
        throw "Required variable DOCKER_LOGIN is missing"
    fi

    if [ "$DOCKER_PASSWORD" = "" ]; then
        throw "Required variable DOCKER_PASSWORD is missing"
    fi

    log "Logging into docker"
    docker login -u $DOCKER_LOGIN -p $DOCKER_PASSWORD

    if [ "$VERSION" = "" ]; then
        throw "Required variable VERSION is missing"
    fi

    if [ "$IMAGE" = "" ]; then
        throw "Required variable IMAGE is missing"
    fi

    if [ "$VERSY_DOCKERFILE_PATH" = "" ]; then
        log "PATH is not set, using '.'"
        VERSY_DOCKERFILE_PATH="."
    fi

    BUILD_COMMAND="docker build $VERSY_DOCKERFILE_PATH -t $IMAGE:$VERSION"
    log "Executing: $BUILD_COMMAND"
    $BUILD_COMMAND

    if grep -q "-" "$VERSION"; then
        log "VERSION contains a hyphen. Not tagging as latest."
    else
        log "VERSION does not contain a hyphen. Tagging as latest."
        TAG_COMMAND="docker tag $IMAGE:$VERSION $IMAGE:latest"
        log "Executing: $TAG_COMMAND"
        $TAG_COMMAND
    fi

    PUSH_COMMAND="docker push $IMAGE:$VERSION"
    log "Executing: $PUSH_COMMAND"
    $PUSH_COMMAND
}