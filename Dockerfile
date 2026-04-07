FROM nginx:alpine

# Remove the default NGINX configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy our template file into the special templates directory.
# The NGINX entrypoint script will automatically read this, replace ${PORT}, 
# and output it to /etc/nginx/conf.d/default.conf when the container boots.
COPY default.conf.template /etc/nginx/templates/default.conf.template

# We don't need a custom CMD or ENTRYPOINT, the alpine image handles it securely.