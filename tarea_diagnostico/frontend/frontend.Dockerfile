FROM nginx:alpine
# COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY views /usr/share/nginx/html