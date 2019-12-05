FROM ubuntu:latest
RUN  apt-get update 
RUN apt-get install -y \
    apache2 \
    mysql-server \
    php7.2 \
    php7.2-bcmath \
    php7.2-mcrypt
COPY start-script.sh /root/
RUN chmod +x /root/start-script.sh 
COPY . /var/www/html/
CMD /root/start-script.sh
