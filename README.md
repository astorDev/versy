# Versy

Scripts and GitHub Actions for creating versions of: [NuGet](./nuget/README.md), [Docker Images](./calver/docker/action.yaml), and others. Build mostly on [CalVer](./calver/README.md) - seemless date-based versioning system. You can check how it works by running the script below:

```sh
export BRANCH=feature-one RUN=8
curl -sSL https://raw.githubusercontent.com/astorDev/versy/refs/heads/main/versy | sh -s calver
```

Here's how the script result might look like:

![](/calver/docker/101-article/demo-101.png)

## Using CalVer In CI Pipelines

Here's a few examples of packing things with CalVer using our helper tools:

**Nuget with GitHub Action:**

Here's what you should do to get your NuGet package published like this:

1. Set repository secret `NUGET_API_KEY`
2. In your repo create `.github/workflows/nuget.yml` with

```yaml
on:
  push:
    paths:
      - 'my/awesome/lib/**'
      - '.github/workflows/nuget.yml'

jobs:
  publish:
    name: Pack & Publish nuget
    runs-on: ubuntu-latest
    steps:
      - uses: astorDev/versy/calver/nuget@main
        with:
          project: my/awesome/lib/My.Awesome.Lib
          nuget-api-key: ${{ secrets.NUGET_API_KEY }}
```

Here's a colored view of a version you might get:

<img src="./calver/colored-version.png" alt="drawing" width="600"/>

**Docker Image with Gitlab:**

> Check out the details [here](./gitlab/README.md)

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

## Different Ways to Run the Scripts

**From the repository root:**

```sh
RUN=32 BRANCH=beta sh .sh calver
```

**Installed locally:**

Add the repo to the path, e.g. open configuration file in VS Code `code ~/.bash_profile` and add

```sh
export PATH="$PATH:/Users/egortarasov/repos/versy"
```

Now for a new shell session you should be able to run a command like this:

```sh
BRANCH=feature-one RUN=40 versy calver
```