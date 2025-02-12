map_gitlab_params() {
    log "Mapping GitLab CI/CD environment variables"

    log "BRANCH=$CI_COMMIT_REF_NAME"
    export BRANCH=$CI_COMMIT_REF_NAME

    log "RUN=$CI_PIPELINE_IID"
    export RUN=$CI_PIPELINE_IID

    log "DOCKER_LOGIN=$CI_REGISTRY_USER"
    export DOCKER_LOGIN=$CI_REGISTRY_USER

    log "DOCKER_PASSWORD=$CI_REGISTRY_PASSWORD"
    export DOCKER_PASSWORD=$CI_REGISTRY_PASSWORD

    log "DOCKER_REGISTRY=$CI_REGISTRY"
    export DOCKER_REGISTRY=$CI_REGISTRY
}