# Versy

GitHub Actions for [CalVer](./calver/README.md) & [NuGet](./nuget/README.md). Here's a simple one liner to check a version you might expect as a result:

```sh
export SOURCING_URL=https://raw.githubusercontent.com/astorDev/versy/main BRANCH=beta RUN=11 && curl -sSL $SOURCING_URL/.sh | sh -s calver
```

Here's the same script runned from the repository root:

```sh
RUN=32 BRANCH=beta sh .sh calver
```

## Using It

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


And you'll get nugets published every time you push with version like this:

<img src="./calver/colored-version.png" alt="drawing" width="600"/>

## Gitlab

Here's a _very opinionated_ (due to the usage of docker) example of a GitLab job:

```yaml
image: docker:latest

services:
  - docker:dind

internalapi-nuget:
  stage: build
  tags:
    - docker
  only:
    changes:
      - /my/awesome/lib/**/*
      - .gitlab-ci.yml
  script:
    - # install dotnet
    - apk add --no-cache icu-libs krb5-libs libgcc libintl libssl3 libstdc++ zlib curl bash ca-certificates
    - curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 8.0 --install-dir /usr/share/dotnet
    - export PATH=$PATH:/usr/share/dotnet
    - dotnet --version
    - # do the job
    - export SOURCING_URL=https://raw.githubusercontent.com/astorDev/versy/main
    - export MAIN=dev
    - export BRANCH=$CI_COMMIT_REF_NAME
    - export RUN=$CI_PIPELINE_IID
    - export PROJECT=my/awesome/lib/My.Awesome.Lib
    - export NUGET_SOURCE="${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/packages/nuget/index.json"
    - export NUGET_API_KEY=$CI_JOB_TOKEN
    - curl -sSL $SOURCING_URL/.sh | sh -s calver_nuget
```