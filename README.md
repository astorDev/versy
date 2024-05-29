# Versy

GitHub Actions for [CalVer](./calver/README.md) & [NuGet](./nuget/README.md).

In your repo create `.github/workflows/nuget.yml` with

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
