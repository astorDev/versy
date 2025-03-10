export BRANCH=main
export RUN=1$(date +%H%M)
export IMAGE=vosarat/calver_docker_test_one
export DOCKERFILE_PATH=docker/Dockerfile
export BUILD_CONTEXT_PATH=docker

# set DOCKER_LOGIN, DOCKER_PASSWORD inside a private file
# e.g.
# code ~/.zshrc

pushd ../../../
sh .sh calver_docker
popd

docker run --pull always vosarat/calver_docker_test_one:latest .