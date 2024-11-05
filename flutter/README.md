# Flutter Build Image

Image allowing you to build your flutter app for web. Here's how you may use it:

```dockerfile
FROM vosarat/flutter AS build

COPY . /app
WORKDIR /app 
RUN flutter clean 
RUN flutter build web

FROM nginx
COPY --from=build /app/build/web /usr/share/nginx/html
```

To figure out how it works checkout the dedicated [article](article/index.md).