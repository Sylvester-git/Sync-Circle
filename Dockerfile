# Use a lightweight base image
FROM ubuntu:20.04 AS build

# Set environment variables to reduce interaction and improve Flutter dependency resolution
ENV DEBIAN_FRONTEND=noninteractive \
    PUB_HOSTED_URL=https://pub.flutter-io.cn \
    FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# Install essential packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl git wget unzip xz-utils ca-certificates libstdc++6 libglu1-mesa fonts-droid-fallback && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone the Flutter SDK
RUN git clone https://github.com/flutter/flutter.git /flutter

# Set Flutter environment paths
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN curl -I https://storage.flutter-io.cn/flutter_infra_release/gradle-wrapper/fd5c1f2c013565a3bea56ada6df9d2b8e96d56aa/gradle-wrapper.tgz

# Run Flutter doctor to verify installation
RUN flutter doctor

# Enable Flutter web and switch to the stable channel
RUN flutter config --enable-web && \
    flutter channel stable && \
    flutter upgrade

# Set the working directory
WORKDIR /app

# Copy the project files into the container
COPY . .

# Fetch Flutter dependencies and build the web project
RUN flutter pub get && \
    flutter build web --release

# Use a lightweight server to serve the built files
FROM nginx:alpine AS production

# Copy the built web files from the build stage
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose the port for the web server
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
