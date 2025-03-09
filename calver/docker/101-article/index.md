# Making Versioning Easy: A Smarter Approach to Software Releases

> Discover how CalVer—a time-based versioning technique—can simplify your release process, and learn how to automate it in a GitHub Actions CI pipeline for Docker image tagging.

Today, most software projects rely on **Semantic Versioning (SemVer)** to manage releases. While SemVer is widely adopted, it comes with its own set of challenges: constant manual tracking of version numbers, arbitrary decisions about release sizes, and the mental overhead of deciding whether a change is a 'major,' 'minor,' or 'patch.'

But what if there was a versioning style that didn’t require you to spend time overthinking releases—one that was both easy to remember and informative? Enter **Calendar Versioning (CalVer)**, a simpler, time-based approach that takes the guesswork out of versioning. In this article, we’ll explore how CalVer works and demonstrate its power by automating it in a GitHub Actions CI pipeline to tag Docker images.

## An Example CalVer Version

A picture is worth a thousand words and so is an example. Let's call a remote script generating a calver version for us:

```sh
export BRANCH=feature-one RUN=8
curl -sSL https://raw.githubusercontent.com/astorDev/versy/refs/heads/main/versy | sh -s calver
```

Here's an example of what we might get in return:

![](demo-101.png)

As you see, we've generated a version number, which indicates the day the version was generated, along with `RUN` number to differentiate versions in case we were building multiple that day and `BRANCH` name, which is appended if the branch is not `MAIN` to indicate a preview version.

What's great about that version is that it is SemVer-compatible and alphabetical, making it suitable for practically any of the systems involving versions. We've prepended one `1` to the month and day number specifically for it to stay both alphabetically-sortable and SemVer compatible, i.e. systems like Nuget don't differentiate between `01` and just `1`.

Here's the same explanation as a picture:

![](calver.png)

Although the version is SemVer-compatible, we didn't have any complications from a real SemVer versioning. We didn't have to think about whether our changes were breaking or not, how significant the changes were, and whether we should stay in beta with `0.x` or not.

That seamless versioning is especially useful for internal packages, images, and stuff like that, when weare  fully aware of the state of our dependencies and the speed of iteration is more important for us than the stability of the integration.

## A Practical Example: GitHub Action for Docker Images

An example is worth a thousand words, but a practical example is worth a thousand more.

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
