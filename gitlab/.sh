map_gitlab_params() {
    export BRANCH=$CI_COMMIT_REF_NAME
    export RUN=$CI_PIPELINE_IID
    export DOCKER_LOGIN=$CI_REGISTRY_USER
    export DOCKER_PASSWORD=$CI_REGISTRY_PASSWORD
    export DOCKER_REGISTRY=$CI_REGISTRY
}