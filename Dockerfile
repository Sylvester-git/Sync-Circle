# Use a lightweight base image
FROM ubuntu:20.04 AS build

# # Set environment variables to reduce interaction and improve Flutter dependency resolution
# ENV DEBIAN_FRONTEND=noninteractive 
# # \
# #     PUB_HOSTED_URL=https://pub.flutter-io.cn \
# #     FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# Install essential packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl git wget unzip xz-utils ca-certificates libstdc++6 libglu1-mesa fonts-droid-fallback && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    git config --global http.postBuffer 157286400

# Clone the flutter repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

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
