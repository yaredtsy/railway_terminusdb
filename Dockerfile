FROM nginx:alpine

RUN apk add --no-cache gettext

# Upstream host:port for TerminusDB (override at deploy time, e.g. Railway variables)
ENV TERMINUSDB_UPSTREAM=terminusdb.railway.internal:6363

COPY nginx.conf /etc/nginx/nginx.conf.template

EXPOSE 80

CMD ["sh", "-c", "envsubst '$TERMINUSDB_UPSTREAM' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && exec nginx -g 'daemon off;'"]