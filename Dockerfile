FROM php:8.2-apache

RUN apt-get update && apt-get install -y libpq-dev \
    && docker-php-ext-install pgsql pdo pdo_pgsql \
    && a2enmod rewrite

COPY . /var/www/html/

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

ENV APACHE_DOCUMENT_ROOT /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]
