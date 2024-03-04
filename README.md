# Versy

Best practices and tools for versioning.

## CalVer

[CalVer](https://calver.org/) is a versioning scheme based on date. This yet another implementation makes versioning

- Effortless
- Easy to remember
- Alphabetical
- Fully nuget-compatible

Here's how it works:

```sh
export BRANCH=feature/one RUN=9 && source calver.sh 
# produces: 2024.103.104.9-feature-one

export BRANCH=main RUN=1 && source calver.sh 
# produces: 2024.103.104.1

export BRANCH=master MAIN=master RUN=1 && source calver.sh 
# produces 2024.103.104.1
```

### Why the 1s?

For some reason nuget tools drops zeros in package versions. For the package to remain alphabeticaly sorted, we need to have 1s in front of month and day.

### Why RUN is required

Based on the assumption that there's always a need to avoid conflicts if there's more than one build in a day. So the only sensible scenario is that the tool just use incorrectly for some reason, which should be prevented.