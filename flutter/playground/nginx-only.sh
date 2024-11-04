flutter build web
docker build -f nginx-only.Dockerfile -t versy-flutter-example .
docker run -p 4444:80 versy-flutter-example