# Use an official Nginx image as the base
FROM nginx:alpine

# Copy the static website files to the Nginx HTML directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 70

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
