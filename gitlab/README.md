# Using Versy in Gitlab

Let's imagine we have a following repository structure:

```text
- 📁 api
    - 📁 host
        - 🐳 Dockerfile
    - 📁 tests
- 📁 ui
- 📁 ...
```

Let's also say we want to build and publish and image every time a commit is pushed. But we want to tag the image as the `latest` only when changes are pushed to the `dev` branch.

Here's the `gitlab-ci.yaml` we may end up with:

```yaml
image: docker:24.0

stages:
  - build

build-api:
  stage: build
  only:
    changes:
      - api/**/*
      - .gitlab-ci.yml
  script:
    - export MAIN=dev
    - export IMAGE=$CI_REGISTRY_IMAGE/api
    - export DOCKERFILE_PATH=api/host/Dockerfile
    - export BUILD_CONTEXT_PATH=api
    - export USE_BUILDX=false

    - apk add curl
    - export SOURCING_URL=https://raw.githubusercontent.com/astorDev/versy/gitlab
    - curl -sSL $SOURCING_URL/.sh | sh -s gitlab_calver_docker
```

Let's now look at the parts of the CI pipeline one-by-one.

## Common Gitlab Base

This part is not specific to versy. We just want to build the API images either when there was a change to the API (anything changed in the `api` folder) or when the pipeline itself has changed:

```yaml
image: docker:24.0

stages:
  - build

build-api:
  stage: build
  only:
    changes:
      - api/**/*
      - .gitlab-ci.yml
```

Next we export some parameters. Let's go through them one-be-one, as well.

## Specifying Versy Parameteres

As we discussed previously we want mark image versions as the `latest` when changes end up in `dev`. `versy` allows to specify the name of the branch for the `latest` as a `MAIN` parameter:

```sh
export MAIN=dev
```

`$CI_REGISTRY_IMAGE` consist of the registry url, along with the project path. We just need to add the name of the particular part of the repository (`api` in our case):

```sh
export IMAGE=$CI_REGISTRY_IMAGE/api
```

Then, we'll need to specify `Dockerfile` path, relative to the repository root. In our case it is the following:

```sh
export DOCKERFILE_PATH=api/host/Dockerfile
```

Next, we'll need to specify from where the docker build is executed:

```sh
export BUILD_CONTEXT_PATH=api
```

By default, `versy` uses buildx and does multi-platform builds. GitLab may not allow this, so we'll disable this:

```sh
export USE_BUILDX=false
```

## Executing Versy Script

Finally, we'll need to run the `gitlab_calver_docker` script. We'll need to install `curl` first, as it is not included in `docker` image. Then we'll set `SOURCING_URL` to make `versy` download helper scripts from the remote url.

So, there's nothing specific to the steps below. This just how you run the versy script:

```yaml
- apk add curl
- export SOURCING_URL=https://raw.githubusercontent.com/astorDev/versy/main
- curl -sSL $SOURCING_URL/.sh | sh -s gitlab_calver_docker
```