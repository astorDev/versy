export BRANCH="A$(uuidgen)"
export RUN=1 
export PROJECT=nuget/Versy.Nuget
export IMAGE=vosarat/versy-hello
export DOCKERFILE_PATH=docker/Dockerfile
sh .sh $1