FROM alpine:latest

# Intro
MAINTAINER Muhammad Romadi Siregar <mromadisiregar@gmail.com>
LABEL version="1.0"
LABEL description="Sample RESTful API with limonade framework"

# Update and upgrade
RUN apk update
RUN apk upgrade

# Install nginx, php7-fpm and git
RUN apk add nginx php7-session php7-fpm git

# Create pid file
RUN mkdir -p /run/nginx

# Creata web directory and copy index.php
RUN mkdir -p /var/www/aye
RUN git clone https://github.com/sofadesign/limonade.git /var/www/aye/limonade/
COPY index.php /var/www/aye/

# Copy virtualhost configuration
RUN rm -f /etc/nginx/conf.d/default.conf
COPY myapps.conf /etc/nginx/conf.d/

# Add script to run services
ADD start.sh /start.sh

# Make it executable
RUN chmod 755 /start.sh

# Start Command
CMD ["/start.sh"]

# Expose port
EXPOSE 80