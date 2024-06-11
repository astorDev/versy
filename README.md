# Versy

GitHub Actions for [CalVer](./calver/README.md) & [NuGet](./nuget/README.md).

## Nuget

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

## Docker

1. Set repository secret `DOCKER_PASSWORD`
2. In your repo create `.github/workflows/docker.yaml` with

```yaml
on:
  push:
    paths: 
      - 'my/awesome/app/**'
      - '.github/workflows/docker.yaml'
  workflow_dispatch:

jobs:
  push-image:
    name: Build & Push image
    runs-on: ubuntu 
    steps:
      - uses: astorDev/versy/calver/docker@main
        with:
          image: 'docker-user/my-awesome-app'
          dockerfile-path: 'my/awesome/app'
          docker-login: 'docker-user'
          docker-password: ${{ secrets.DOCKER_PASSWORD }}
```
