# # Install Operating system and dependencies
# FROM ubuntu:20.04

# ENV DEBIAN_FRONTEND=noninteractive

# RUN apt-get update && \
#     apt-get install -y --no-install-recommends --fix-missing curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback python3 && \
#     apt-get clean


# # RUN apt-get update 
# # RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback python3
# # RUN apt-get clean

# ENV DEBIAN_FRONTEND=dialog
# ENV PUB_HOSTED_URL=https://pub.flutter-io.cn
# ENV FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# RUN apt-get update && \
#     apt-get install -y curl git unzip xz-utils ca-certificates && \
#     update-ca-certificates && \
#     apt-get clean

# # download Flutter SDK from Flutter Github repo
# RUN git clone https://github.com/flutter/flutter.git /Users/Ebine/Dev/flutter

# # Set flutter environment path
# ENV PATH="/Users/Ebine/Dev/flutter/bin:/Users/Ebine/Dev/flutter/bin/cache/dart-sdk/bin:${PATH}"

# # Run flutter doctor
# RUN flutter doctor

# # Enable flutter web
# RUN flutter channel master
# RUN flutter upgrade
# RUN flutter config --enable-web

# # Copy files to container and build
# RUN mkdir /app/
# COPY . /app/
# WORKDIR /app/
# RUN flutter build web

# # Record the exposed port
# EXPOSE 9000

# # make server startup script executable and start the web server
# RUN ["chmod", "+x", "/app/server/server.sh"]

# ENTRYPOINT [ "/app/server/server.sh"]

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
