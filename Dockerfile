# Use the prebuilt Flutter image as the base for the build stage
FROM fischerscode/flutter:3.24.3 as build

# Set the working directory
WORKDIR /app

# Copy project files into the container
COPY . .

# Debug: Check file permissions and ownership
RUN ls -l /app && whoami

# Fix file permissions
RUN chown -R flutter:flutter /app && chmod -R 777 /app

# Enable Flutter web and fetch dependencies
RUN flutter config --enable-web && \
    flutter pub get

# Build the Flutter web project in release mode
RUN flutter build web --release

# Use a lightweight Nginx image for serving the Flutter web app
FROM nginx:alpine as production

# Copy the built web files from the build stage
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose the port for the web server
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]

