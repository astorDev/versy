docker build . -f full.Dockerfile -t versy-flutter-example &&
docker run -p 4444:80 versy-flutter-example