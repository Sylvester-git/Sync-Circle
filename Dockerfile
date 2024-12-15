# Use a lightweight base image
FROM ubuntu:20.04 AS build

# Set environment variable to disable interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# # Set environment variables to reduce interaction and improve Flutter dependency resolution
# ENV DEBIAN_FRONTEND=noninteractive 
# # \
# #     PUB_HOSTED_URL=https://pub.flutter-io.cn \
# #     FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# Install essential packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl git wget unzip xz-utils ca-certificates libstdc++6 libglu1-mesa fonts-droid-fallback openjdk-17-jdk && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    git config --global http.postBuffer 157286400

# Clone the flutter repo
# Clone the flutter repo and check out version 3.24.3 from the master branch
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter && \
    cd /usr/local/flutter && \
    git fetch --tags && \
    git checkout 3.24.3

# Set flutter path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Enable flutter web
RUN flutter channel master
RUN flutter upgrade
RUN flutter config --enable-web

# Run flutter doctor
RUN flutter doctor -v

# Set the working directory
WORKDIR /app

# Copy the project files into the container
COPY . .

# **Second resolve**: Download the Gradle wrapper directly into the container if not already present
RUN curl -L -o /usr/local/flutter/bin/cache/downloads/flutter_infra_release/gradle-wrapper.tgz https://storage.googleapis.com/flutter_infra_release/gradle-wrapper/fd5c1f2c013565a3bea56ada6df9d2b8e96d56aa/gradle-wrapper.tgz && \
    mkdir -p /usr/local/flutter/bin/cache/artifacts/gradle_wrapper && \
    tar -xzf /usr/local/flutter/bin/cache/downloads/flutter_infra_release/gradle-wrapper.tgz -C /usr/local/flutter/bin/cache/artifacts/gradle_wrapper

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
