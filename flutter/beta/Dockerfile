FROM ubuntu AS build

RUN apt-get update
RUN apt-get install -y curl git unzip

RUN git clone https://github.com/flutter/flutter.git 

ENV PATH="/flutter/bin:${PATH}"
RUN flutter channel beta
RUN flutter upgrade
RUN flutter build web || echo "expected fail (build triggered to preload web sdk)"
RUN flutter --version