# Nuget

Tools packing & publishing nugets with a custom version.

Here's how is works:

```sh
export VERSION=2.2.2-alpha PROJECT=nuget/Versy.Nuget NUGET_API_KEY=.... && sh nuget/.sh
# Publishes Versy.Nuget.2.2.2-alpha.nupkg to nuget.org with the provided API key
```