# ============================================================
# Dockerfile — Blog CodeIgniter 3
# PHP 7.4 + Apache + mod_rewrite
# ============================================================
FROM php:7.4-apache

# Habilita mod_rewrite do Apache (necessário para CI3)
RUN a2enmod rewrite

# Instala extensões PHP necessárias para CodeIgniter 3
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    libonig-dev \
    libxml2-dev \
    unzip \
    git \
    && docker-php-ext-configure gd \
        --with-freetype \
        --with-jpeg \
    && docker-php-ext-install \
        mysqli \
        pdo \
        pdo_mysql \
        mbstring \
        intl \
        zip \
        gd \
        exif \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copia a configuração PHP personalizada
COPY docker/php/local.ini /usr/local/etc/php/conf.d/local.ini

# Copia a configuração do VirtualHost Apache
COPY docker/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

# Define o diretório de trabalho
WORKDIR /var/www/html

# Copia todo o projeto para dentro do container
COPY . .

# Ajusta permissões para as pastas que precisam de escrita
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 777 /var/www/html/application/cache \
    && chmod -R 777 /var/www/html/application/logs \
    && chmod -R 777 /var/www/html/assets

EXPOSE 80
