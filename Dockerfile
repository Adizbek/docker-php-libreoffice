FROM alpine:3.10 as prod

LABEL maintainer="Ergashev Adizbek <adizbek1998@gmail.com>" \
		version.image="1.0" \
		description="A universal image to run laravel app, designed to use with web, queue, and working with libreoffice"

# install libreoffice as we need it
RUN apk --no-cache add libreoffice msttcorefonts-installer fontconfig && \
    update-ms-fonts && \
    fc-cache -f

# install php and its dependencies
RUN apk add --no-cache php7 php7-fpm php7-mysqli php7-mbstring php7-gd php7-json php7-openssl php7-zlib \
            php7-xml php7-simplexml php7-phar php7-sockets php7-intl php7-dom php7-xmlreader php7-ctype php7-session php7-curl php7-iconv \
            php7-tokenizer php7-pcntl php7-xmlwriter php7-fileinfo php7-posix php7-zip php7-pdo php7-pdo_sqlite \
            php7-pdo_mysql nano curl nginx supervisor

RUN pip3 install unoconv
#install composer itself
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
