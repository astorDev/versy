push_docker() {
    log "Building and publishing docker image"
    log "VERSION='$VERSION'" 
    log "IMAGE='$IMAGE'"
    log "BUILD_CONTEXT_PATH='$BUILD_CONTEXT_PATH'"
    log "DOCKERFILE_PATH='$DOCKERFILE_PATH'" 
    log "DOCKER_LOGIN='$DOCKER_LOGIN'" 
    log "DOCKER_PLATFORM='$DOCKER_PLATFORM'"
    log "DOCKER_REGISTRY='$DOCKER_REGISTRY'"
    log "EXTRA_FLAGS='$EXTRA_FLAGS'"
    log "USE_BUILDX='$USE_BUILDX'"

    if [ "$DOCKER_LOGIN" = "" ]; then
        throw "Required variable DOCKER_LOGIN is missing"
    fi

    if [ "$DOCKER_PASSWORD" = "" ]; then
        throw "Required variable DOCKER_PASSWORD is missing"
    fi

    log "Logging into docker"
    docker login -u $DOCKER_LOGIN -p $DOCKER_PASSWORD $DOCKER_REGISTRY

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
        log "DOCKERFILE_PATH is not set, using default: (./Dockerfile)"
        DOCKERFILE_PATH="./Dockerfile"
    fi

    if [ "$USE_BUILDX" = "" ]; then
        log "USE_BUILDX is not set, using default: TRUE"
        USE_BUILDX="TRUE"
    fi

    if (echo "$VERSION" | grep -q "-"); then # () is important to preserve execution order.
        TAG_OPTIONS="--tag $IMAGE:$VERSION"
        log "VERSION contains a hyphen. Applying only calver tag ($TAG_OPTIONS)."
    else
        TAG_OPTIONS="--tag $IMAGE:$VERSION --tag $IMAGE:latest"
        log "VERSION does not contain a hyphen. Applying calver and latest tags ($TAG_OPTIONS)."
    fi

    if [ "$DOCKER_PLATFORM" = "" ]; then
        log "DOCKER_PLATFORM is not set, using 'linux/amd64,linux/arm64'"
        DOCKER_PLATFORM="linux/amd64,linux/arm64"
    fi

    if [ "$USE_BUILDX" != "FALSE" ]; then
        log "USE_BUILDX is not set to FALSE. It's enabled by default, using buildx"
        BUILD_COMMAND="docker buildx build --platform $DOCKER_PLATFORM --push $EXTRA_FLAGS $BUILD_CONTEXT_PATH --file $DOCKERFILE_PATH $TAG_OPTIONS"
        log "Executing: $BUILD_COMMAND"
        $BUILD_COMMAND
    else
        log "USE_BUILDX is set to FALSE. Using regular build"
        BUILD_COMMAND="docker build --push $EXTRA_FLAGS $BUILD_CONTEXT_PATH --file $DOCKERFILE_PATH $TAG_OPTIONS"
        log "Executing: $BUILD_COMMAND"
        $BUILD_COMMAND
        PUSH_COMMAND="docker push $IMAGE --all-tags"
        log "Executing: $PUSH_COMMAND"
        $PUSH_COMMAND
    fi

}