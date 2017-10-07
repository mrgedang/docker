#!/bin/sh
# Sepertinya harus jadi daemon semua
/usr/sbin/php-fpm7 && /usr/sbin/nginx -g "daemon off;"