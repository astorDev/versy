FROM ubuntu AS build

RUN apt-get update
RUN apt-get install -y curl git unzip

RUN git clone https://github.com/flutter/flutter.git 

ENV PATH="/flutter/bin:${PATH}"
RUN flutter doctor -v
COPY . /app
WORKDIR /app
RUN flutter clean
RUN flutter build web

FROM nginx
COPY --from=build /app/build/web /usr/share/nginx/html