FROM php:7.2-fpm

COPY ./cacert.pem /usr/lib/ssl/cert.pem

RUN docker-php-ext-install pdo_mysql && \
    pecl install swoole && \
    pecl install redis && \
    docker-php-ext-enable swoole && \
    docker-php-ext-enable redis && \
    docker-php-ext-install bcmath 


RUN apt-get update && \
    apt-get install -y gnupg2 && \
    cd /etc/apt && \
    cp sources.list sources.list.back && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse" > sources.list && \
    echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse" >> sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse" >> sources.list && \
    echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse" >> sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse" >> sources.list && \
    echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse" >> sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse" >> sources.list && \
    echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse" >> sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse" >> sources.list && \
    echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse" >> sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32 && \
    apt-get clean && \
    apt-get update 
