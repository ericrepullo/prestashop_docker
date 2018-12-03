FROM ubuntu:18.04
RUN apt-get update
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -y apache2 && apt-get install -y unzip && apt-get install -y php && apt-get install -y wget
RUN a2enmod rewrite
RUN apt-get install -y libapache2-mod-php php-cli php-mysql php-zip php-ldap php-curl php-gd php-odbc php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap php-intl curl
RUN service apache2 restart
RUN cd /var/www/html && wget https://download.prestashop.com/download/releases/prestashop_1.7.4.4.zip && unzip prestashop_1.7.4.4.zip
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html
EXPOSE 8080 80
