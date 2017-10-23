FROM centos

MAINTAINER Muhammad Romadi Siregar <mromadisiregar@gmail.com>

# Install httpd, mod_security, php
RUN yum -y update
RUN yum -y install php php-mysql httpd mod_security mod_security_crs

# We need source of some fixed cms
# So we can set static variables on this image
# This static variables will be used at docker-compose.yml as environment settings
# Assume DocumentRoot is /var/www/html
WORKDIR /var/www/html

# Implement variables for compose
# VAR_CUSTOM_VHOST, VAR_DB_HOST, VAR_DB_PORT, VAR_DB_DATABASE, VAR_DB_USER, VAR_DB_PASSWORD
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 80
CMD ["httpd","-DFOREGROUND"]