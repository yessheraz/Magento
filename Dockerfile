FROM ubuntu:latest
RUN  apt-get update 
RUN apt-get install software-properties-common -y
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y \
    apache2 \
    mysql-server \
    php7.2 \
    php7.2-bcmath \
    php7.2-cli \
    php7.2-common
COPY start-script.sh /root/
RUN chmod +x /root/start-script.sh 
COPY . /var/www/html/
#CMD /root/start-script.sh
CMD service mysql start
CMD a2enmod rewrite
CMD service apache2 start
