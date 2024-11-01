FROM vosarat/flutter:2024.111.101.3 AS build-env

COPY . /app
RUN cd app && flutter build web

FROM nginx

COPY --from=build-env /app/build/web /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]