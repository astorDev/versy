# Deploying Flutter Web with Docker

In march 2021, flutter 2.0 included support for web as target platfrom. Still there's no clear official instruction on how to set it up with a de-facto standard platfrom for web applications deployment - docker. In this article we'll investigate how to make those two play nicely together. Without further ado, let's get to code!

> Or jump straight to the [TLDR](#tldr) to find an example setup.

## TLDR

This article shed a light on creating a dockerfile for you flutter web app. Here's a short snippet of the final version:

```dockerfile
FROM vosarat/flutter AS build

COPY . /app
WORKDIR /app 
RUN flutter clean 
RUN flutter build web

FROM nginx
COPY --from=build /app/build/web /usr/share/nginx/html
```

The version utilizes base image from my docker registry. You can find the source code for it in the dedicated [repository folder](https://github.com/astorDev/versy/tree/main/flutter) and, by the way ... claps are appreciated! 👏