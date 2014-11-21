#tasksel && lamp
apt-get install -y tasksel 
apt-get update 

#install LAMP
tasksel install lamp-server 
apt-get update 


#config apache
a2enmod rewrite 
a2enmod ssl 
mkdir /etc/apache2/ssl 
openssl req -x509 -nodes -days 365000 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt 
mv /etc/apache2/apache2.conf /etc/apache2/apache2.conf.bak 
cp apache2.conf /etc/apache2/ 
cp default-ssl.conf /etc/apache2/sites-enabled/default-ssl.conf 
cp 000-default.conf /etc/apache2/sites-enabled/000-default.conf 
chown root:root /etc/apache2/sites-enabled/default-ssl.conf 
chmod 644 /etc/apache2/sites-enabled/default-ssl.conf 
sudo apt-get install -y php5-json
service apache2 restart 

# app file
rm -rf /var/www/* 