FROM google/dart:latest
COPY ./ ./
USER 0:0
WORKDIR /app_name
ADD pubspec.* /app_name/
RUN pub get --no-precompile
ADD . /app_name/
RUN pub get --offline --no-precompile
ENV ANGEL_ENV=production
EXPOSE 8080
CMD ["dart", "bin/prod.dart","--address","0.0.0.0","--port","8080"]

#app_name docker run -p 8080:8080 -it 