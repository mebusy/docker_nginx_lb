FROM nginx

COPY nginx.conf /etc/nginx/

COPY ssl_cert /etc/nginx/ssl_cert


