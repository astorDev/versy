push_docker() {
    log "Building and publishing docker image (VERSION='$VERSION', IMAGE='$IMAGE', BUILD_CONTEXT_PATH='$BUILD_CONTEXT_PATH' DOCKERFILE_PATH='$DOCKERFILE_PATH' DOCKER_LOGIN='$DOCKER_LOGIN')"

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

    if [ "$BUILD_CONTEXT_PATH" = "" ]; then
        log "PATH is not set, using '.'"
        BUILD_CONTEXT_PATH="."
    fi

if [ "$DOCKERFILE_PATH" = "" ]; then
        log "DOCKERFILE_PATH is not set, using default: (PATH/Dockerfile)"
        DOCKERFILE_PATH="PATH/Dockerfile"
    fi

    if (echo "$VERSION" | grep -q "-"); then # () is important to preserve execution order.
        TAG_OPTIONS="--tag $IMAGE:$VERSION"
        log "VERSION contains a hyphen. Applying only calver tag ($TAG_OPTIONS)."
    else
        TAG_OPTIONS="--tag $IMAGE:$VERSION --tag $IMAGE:latest"
        log "VERSION does not contain a hyphen. Applying calver and latest tags ($TAG_OPTIONS)."
    fi

    BUILD_COMMAND="docker buildx build --platform linux/amd64,linux/arm64 --push $BUILD_CONTEXT_PATH --file $DOCKERFILE_PATH $TAG_OPIONS"
    log "Executing: $BUILD_COMMAND"
    $BUILD_COMMAND

    # if (echo "$VERSION" | grep -q "-"); then # () is important to preserve execution order.
    #     log "VERSION contains a hyphen. Not tagging as latest."
    # else
    #     log "VERSION does not contain a hyphen. Tagging as latest."
    #     TAG_COMMAND="docker tag $IMAGE:$VERSION $IMAGE:latest"
    #     log "Executing: $TAG_COMMAND"
    #     $TAG_COMMAND
    # fi

    # PUSH_COMMAND="docker push $IMAGE --all-tags"
    # log "Executing: $PUSH_COMMAND"
    # $PUSH_COMMAND
}