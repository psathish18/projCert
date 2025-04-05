FROM devopsedu/webapp
ADD website /var/www/html
RUN rm  /var/www/html/index.html
EXPOSE 80

# Set the command to start Apache
CMD ["apachectl", "-D", "FOREGROUND"]