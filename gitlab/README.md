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