FROM ubuntu:latest

RUN apt-get update && apt-get install -y apache2 php libapache2-mod-php
# Enable the PHP module
RUN a2enmod php$(php -r "echo substr(PHP_VERSION, 0, 3);")

# Copy your website files
ADD website /var/www/html/

# Set correct ownership
RUN chown -R www-data:www-data /var/www/html/

RUN rm  /var/www/html/index.html

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
