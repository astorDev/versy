FROM ubuntu

RUN apt-get update
RUN apt-get install -y curl git unzip

RUN git clone https://github.com/flutter/flutter.git 

RUN echo "lol"
ENV PATH="/flutter/bin:${PATH}"
RUN flutter doctor -v