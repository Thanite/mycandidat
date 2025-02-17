FROM php:8.4-fpm
# LABEL maintainer="hasham1983@yahoo.com"
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN curl -sS https://getcomposer.org/installer | php -- \
    &&  mv composer.phar /usr/local/bin/composer
# RUN docker-php-ext-configure intl 

RUN apt update && apt install -y \
    libicu-dev \
    libonig-dev \
    libzip-dev \
    libpcre3 \
	libxml2-dev \
	libpng-dev \
    git \
    zip \
    unzip \
    && docker-php-ext-install -j$(nproc) mbstring  \
    pdo pdo_mysql \
    opcache \
    intl \
    dom \
    gd
    # calendar
	
RUN curl -sS https://get.symfony.com/cli/installer | bash \
    && mv /root/.symfony5/bin/symfony /usr/local/bin 

RUN printf 'short_open_tag = off\n' >> /usr/local/etc/php/conf.d/short-tag.ini 

# RUN pecl install apcu && docker-php-ext-enable apcu

# RUN export PATH="$HOME/.symfony/bin:$PATH"
RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
# RUN chmod 775 /tmp/hasham/shell.sh
# RUN echo '*/1  *  *  *  *    /tmp/hasham/shell.sh' > /etc/crontabs/root
# CMD crond && sleep infinite