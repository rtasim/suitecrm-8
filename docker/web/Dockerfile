FROM srmklive/docker-nginx-php:8.2

LABEL maintainer="Asim Bashir<asim.bashir@rolustech.net>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade

# Adds nginx configurations
ADD default.conf    /etc/nginx/conf.d/default.conf
ADD www.conf        /etc/php/8.3/fpm/pool.d/www.conf

# Set apps home directory.
ENV APP_DIR /server/http

# Define current working directory.
WORKDIR ${APP_DIR}

RUN apt-get -y autoclean \
  && apt-get -y autoremove \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && echo "daemon on;" >> /etc/nginx/nginx.conf

EXPOSE 80

COPY supervisor.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]