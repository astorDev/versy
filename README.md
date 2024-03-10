# Versy

Best practices and tools for versioning and package management.

Publish [NuGet](./nuget/README.md) with [CalVer](./calver/README.md)

```yaml
on:
  push:

jobs:
  publish:
    name: Pack & Publish nuget
    runs-on: ubuntu-latest
    steps:
      - uses: astorDev/versy/calver/nuget@main
        with:
          project: my/awesome/lib/My.Awesome.Lib
          nuget_api_key: ${{ secrets.NUGET_API_KEY }}
```

