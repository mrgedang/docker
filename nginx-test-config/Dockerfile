FROM nginx

COPY custom.conf /etc/nginx/conf.d/
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log
RUN mkdir -p /var/www/aye/
COPY index.html /var/www/aye/