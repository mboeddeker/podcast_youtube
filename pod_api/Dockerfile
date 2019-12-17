FROM google/dart:latest

COPY ./ ./

# Install dependencies, pre-build
RUN pub get

# Optionally build generaed sources.
# RUN pub run build_runner build

# Set environment, start server
ENV ANGEL_ENV=production
EXPOSE 3000
CMD dart bin/server.dart

#app_name docker run -p 8080:8080 -it 