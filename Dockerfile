FROM nginx:alpine

# Install envsubst
RUN apk add --no-cache gettext

COPY nginx.conf.template /etc/nginx/nginx.conf.template

# Railway sets PORT env var
CMD sh -c "envsubst '\$PORT' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'"

EXPOSE 80