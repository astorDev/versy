# Deploying Flutter Web with Docker

In March 2021, Flutter 2.0 included support for the web as a target platform. Still, there's no clear official instruction on how to set it up with a de-facto standard platform for web applications deployment - docker. In this article, we'll investigate how to make those two play nicely together. Without further ado, let's get to code!

> Or jump straight to the [TLDR](#tldr) to find an example setup.

![](thumb.png)

## Naive Implementation: Nginx Only Image

Let's build our app for the web release. Assuming, you are in the root folder of a flutter app all you need to do is run the command below:

```sh
flutter build web
```

This will place our web site files, like `index.html` in the folder `build/web`. All we need to do to get a fully functional web app is to host our files in an web server. Let's use `nginx`. We'll need to put our built files in a dedicated nginx folder. Here's the `Dockerfile` we'll get:

```dockerfile
FROM nginx
COPY /build/web /usr/share/nginx/html
```

Let's also create a `compose.yml` file to simplify deploying our app

```yaml
services:
  example:
    build: .
    ports:
      - "4444:80"
```

With the file in place we can deploy our app by running the command below:

```sh
docker compose up -d --build
```

When it's finished, we should be able to see our app by navigating to `localhost:4444` in a browser. Although current version works there's a huge pitfall in the current implementation, so let's fix it now.

## Full Dockerfile: Building Hosting Files  

The problem with our first implementation is that we used a pre-built files. A proper `Dockerfile` should build the whole application from scratch, so that we don't have to rely on any other files for that. This is especially useful if you want to use your `Dockerfile` in a CI pipeline. So let's create a proper image. Let's take `ubuntu`, install necessary dependencies, clone flutter repo, and install CLI command in the path:

```dockerfile
FROM ubuntu AS build

RUN apt-get update
RUN apt-get install -y curl git unzip

RUN git clone https://github.com/flutter/flutter.git 

ENV PATH="/flutter/bin:${PATH}"
```

With that we'll be able to actually build our app from within the docker builder process. Let's copy our files, move to where we've copied them, `clean` the folder just to make sure we won't be affected by any unexpected caching, and finally build our app:

```dockerfile
COPY . /app
WORKDIR /app
RUN flutter clean
RUN flutter build web
```

With that in place we'll just need to change our existing deployment via nginx to copy files not from our local machine, but from the previous stage we called `build`:

```dockerfile
FROM nginx
COPY --from=build /app/build/web /usr/share/nginx/html
```

Here's the complete file:

```dockerfile
FROM ubuntu AS build

RUN apt-get update
RUN apt-get install -y curl git unzip

RUN git clone https://github.com/flutter/flutter.git 

ENV PATH="/flutter/bin:${PATH}"

COPY . /app
WORKDIR /app
RUN flutter clean
RUN flutter build web

FROM nginx
COPY --from=build /app/build/web /usr/share/nginx/html
```

With the new configuration, running `docker compose up -d --build` will result in the same app as before, deployed to `localhost:5555`. The difference is that now the whole build process is happening inside the docker process. Now our `Dockerfile` is CI-ready! However, we can do something slightly better.

## Using Base Build Image

As you may notice, first lines in our new `Dockerfile` are not specific to our app, but just prepare an ubuntu instance with Flutter CLI. The setup is a good candidate for a dedicated docker image. However, for some reason Flutter team doesn't provide an official one. So I've built and published custom one, called `vosarat/flutter`. Let me show you what's inside!

> There's also `vosarat/flutter-beta` image, in case you need one.

Well, essentially, the image is a copy of the first steps in the previous file with just two enchancements on top. The reason behind adding those two lines is that flutter downloads certain SDKs, like web on the first run of an matching CLI command. So we'll let flutter decide what it needs regardless of the platform target by running `doctor -v`

```dockerfile
RUN flutter doctor -v
```

Also since the image is for web apps we'll force downloading of web sdk by running `flutter build web`. Of course, flutter won't be able to actually execute the build since we don't have a project there yet. That's fine, the web sdk will be downloaded any way and we'll intercept error by using `||` directive:

```dockerfile
RUN flutter build web || echo "expected fail (build triggered to preload web sdk)"
```

With that we'll get the following dockerfile for our base image:

```dockerfile
FROM ubuntu AS build

RUN apt-get update
RUN apt-get install -y curl git unzip

RUN git clone https://github.com/flutter/flutter.git 

ENV PATH="/flutter/bin:${PATH}"

RUN flutter doctor -v
RUN flutter build web || echo "expected fail (build triggered to preload web sdk)"
```

Knowing how it all works, let's wrap it up with an example of production-ready flutter web `Dockerfile` utilizing `vosarat/flutter`

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
