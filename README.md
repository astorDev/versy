# Versy

Best practices and tools for versioning and package management.

GitHub workflow to publish [NuGet](./nuget/README.md) with [CalVer](./calver/README.md)

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

The version you''ll get:

<img src="./calver/colored-version.png" alt="drawing" width="600"/>

- 🔵 Library name
- 🟡 Current date
- 🔴 Avoiding trailing 0s
- 🟣 CI run
- 🟢 Branch name suffix (for non-main branches)