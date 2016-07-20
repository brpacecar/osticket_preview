#!/bin/bash

dbrootpass='password'

apt-get update

debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password password'
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password password'

apt-get install -y apache2 php5 mysql-server php5-mysql php5-gd php5-apcu php5-intl

mysql -uroot -p$dbrootpass -e "create database osticket;create user osticket@localhost identified by 'password';grant all privileges on osticket.* to osticket@localhost"

tar -xzf /vagrant/v1.10-rc.3.tar.gz -C /tmp

cp -R /tmp/osTicket-1.10-rc.3/* /var/www/html/
cp /var/www/html/include/ost-sampleconfig.php /var/www/html/include/ost-config.php
chown www-data. /var/www/html/include/ost-config.php

rm /var/www/html/index.html

service apache2 restart
