# Versy

Best practices and tools for versioning.

## CalVer

[CalVer](https://calver.org/) is a versioning scheme based on date. This yet another implementation makes versioning

- Effortless
- Easy to remember
- Alphabetical
- Fully nuget-compatible

Here's how it works:

> Imagining today is 5th of March, 2024

```sh
export BRANCH=feature/five && export SUFFIX=$(./suffix.sh) RUN=1 && echo $(./calver/.sh)
# 2024.103.105.1-feature-five

export BRANCH=main && export SUFFIX=$(./suffix.sh) RUN=9 && echo $(./calver/.sh)
# 2024.103.105.9
```

### Why the 1s?

For some reason, nuget tools drop zeros in package versions. For the package to remain alphabetically sorted, we need to have 1s in front of month and day.

### Why RUN is required

Based on the assumption that there's always a need to avoid conflicts if there's more than one build in a day. So the only sensible scenario is a mistake, which should be prevented.
