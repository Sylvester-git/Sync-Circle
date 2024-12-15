# Use the prebuilt Flutter image as the base for the build stage
FROM fischerscode/flutter:3.24.3 as build

# Set the working directory
WORKDIR /app

# Copy project files into the container
COPY . .

# Switch to root user temporarily
USER root

# Pre-cache Flutter tools and dependencies
RUN flutter precache && \
    flutter doctor && \
    flutter config --enable-web 

# Debug Flutter SDK version
RUN flutter --version

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

