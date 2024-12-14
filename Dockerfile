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
# RUN git clone https://github.com/flutter/flutter.git 

# # /Users/Ebine/Dev/flutter

# # # Set flutter environment path
# # ENV PATH="/Users/Ebine/Dev/flutter/bin:/Users/Ebine/Dev/flutter/bin/cache/dart-sdk/bin:${PATH}"

# # Run flutter doctor
# # RUN flutter doctor

# # Enable flutter web
# RUN flutter doctor
# RUN flutter channel master && flutter upgrade
# RUN flutter config --enable-web

# # Copy files to container and build
# RUN mkdir /app/
# COPY . /app/
# WORKDIR /app/
# RUN flutter build web xcopy /E /H /Y build\web\* docs\
# # Record the exposed port
# EXPOSE 9000

# # make server startup script executable and start the web server
# RUN ["chmod", "+x", "/app/server/server.sh"]

# ENTRYPOINT [ "/app/server/server.sh"]

# Use the official Flutter base image
FROM cirrusci/flutter:stable

# Set the working directory in the container
WORKDIR /app

# Install required dependencies
RUN apt-get update && apt-get install -y nginx curl unzip git

# Copy the Flutter project files into the container
COPY . .

# Run Flutter doctor to ensure Flutter is set up correctly
RUN flutter doctor

# Enable Flutter web support
RUN flutter config --enable-web

# Ensure Flutter dependencies are fetched
RUN flutter pub get

# Build the Flutter web project
RUN flutter build web

# Set up Nginx to serve the Flutter web app
RUN rm -rf /etc/nginx/sites-enabled/default && \
    echo "server { \
            listen 80; \
            server_name localhost; \
            root /app/build/web; \
            index index.html; \
            location / { \
                try_files \$uri \$uri/ /index.html; \
            } \
         }" > /etc/nginx/sites-available/default && \
    ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# Expose port 80 for the web server
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
