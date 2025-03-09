# Making Versioning Easy: A Smarter Approach to Software Releases

> Discover how CalVer—a time-based versioning technique—can simplify your release process, and learn how to automate it in a GitHub Actions CI pipeline for Docker image tagging.

Today, most software projects rely on **Semantic Versioning (SemVer)** to manage releases. While SemVer is widely adopted, it comes with its own set of challenges: constant manual tracking of version numbers, arbitrary decisions about release sizes, and the mental overhead of deciding whether a change is a 'major,' 'minor,' or 'patch.'

But what if there was a versioning style that didn’t require you to spend time overthinking releases—one that was both easy to remember and informative? Enter **Calendar Versioning (CalVer)**, a simpler, time-based approach that takes the guesswork out of versioning. In this article, we’ll explore how CalVer works and demonstrate its power by automating it in a GitHub Actions CI pipeline to tag Docker images.

## An Example CalVer Version

```sh
export BRANCH=feature-one RUN=8
curl -sSL https://raw.githubusercontent.com/astorDev/versy/refs/heads/main/versy | sh -s calver
```

![](demo-101.png)

![](calver.png)

## A Practical Example: GitHub Action for Docker Images

```yaml
jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - uses: astorDev/versy/calver/docker@main
        with:
            # ...
```

```yaml
image: 'my-docker-name/service-a'
# ...
docker-login: my-docker-name
docker-password: ${{ secrets.DOCKER_PASSWORD }}
```

```yaml
build-context-path: 'service-a'
dockerfile-path: 'service-a/Dockerfile'
```

```yaml
on:
  push:
    paths:
      - '.github/workflows/service-a.yml'
      - 'service-a/**'
  workflow_dispatch:
```

```yaml
on:
  push:
    paths:
      - '.github/workflows/service-a.yml'
      - 'service-a/**'
  workflow_dispatch:
    
jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - uses: astorDev/versy/calver/docker@main
        with:
          image: 'my-docker-name/service-a'
          build-context-path: 'service-a'
          dockerfile-path: 'service-a/Dockerfile'
          docker-login: my-docker-name
          docker-password: ${{ secrets.DOCKER_PASSWORD }}
```

![](docker-feature-part-1.png)

![](docker-feature-part-2.png)

![](docker-main-part-1.png)

![](docker-main-part-2.png)

## Wrapping Up!

Versioning doesn’t have to be complicated. While SemVer has been the go-to approach for years, it often comes with unnecessary overhead—forcing developers to manually track versions and arbitrarily decide release sizes. CalVer, on the other hand, offers a simpler, time-based alternative that eliminates the guesswork and keeps your versioning process clean and intuitive.

In this article, we explored how CalVer works, why it’s a great fit for modern software projects, and even used it in a GitHub Actions CI pipeline to tag Docker images. Whether you’re managing a fast-paced project or just looking to streamline your release process, CalVer might be the versioning strategy you’ve been missing.

The Github Action we used is part of a project called Versy. Check it out [here on GitHub](https://github.com/astorDev/versy). Don't hesitate to give it a star! ⭐

And also... claps are appreciated! 👉👈
