FROM nginx:alpine

# Copy your custom nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 (Railway will automatically detect and route to this)
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]