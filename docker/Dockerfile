FROM php:8.0-fpm as base
ARG SPMETHING

WORKDIR /var/www/
RUN rm -r /var/www/html

RUN apt update \
    && apt install -y libzip-dev \
    && docker-php-ext-install zip

COPY dc.lock /dc.lock
COPY docker/layers/ /layers/
RUN /layers/_install.sh


FROM base as dev

RUN curl https://raw.githubusercontent.com/composer/getcomposer.org/95d11ed947f602b5a5f83f80c062e134d62c9f4b/web/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN curl -L https://github.com/symfony/cli/releases/download/v4.23.5/symfony_linux_amd64.gz \
    | gzip -d -c > /usr/local/bin/symfony \
    && chmod +x /usr/local/bin/symfony

RUN /layers/_install.sh --dev


FROM dev as build


FROM build as prod
