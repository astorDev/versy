# Deploying Flutter Web with Docker

In March 2021, Flutter 2.0 included support for the web as a target platform. Still, there's no clear official instruction on how to set it up with a de-facto standard platform for web applications deployment - docker. In this article, we'll investigate how to make those two play nicely together. Without further ado, let's get to code!

> Or jump straight to the [TLDR](#tldr) to find an example setup.

## TLDR

This article sheds light on creating a dockerfile for your Flutter web app. Here's a short snippet of the final version:

```dockerfile
FROM vosarat/flutter AS build

COPY . /app
WORKDIR /app 
RUN flutter clean 
RUN flutter build web

FROM nginx
COPY --from=build /app/build/web /usr/share/nginx/html
```

The version utilizes a base image from my docker registry. You can find the source code for it in the dedicated [repository folder](https://github.com/astorDev/versy/tree/main/flutter) and, by the way ... claps are appreciated! 👏
