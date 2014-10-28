# Scripts for configuring Console AWS AMI

## Instructions:


### Installing software

```
# connect with the instance
ssh -i aws-oregon-trampolim.pem ec2-user@[IP]

# change user to root
sudo -s

# configuring hostname
sudo sed -i "s/\(HOSTNAME=\).*\$/HOSTNAME=trampolim/" /etc/sysconfig/network

# Installing packages
sudo yum -y update
sudo yum -y install curl gcc httpd httpd-devel libcurl-devel git ruby-devel htop

# installing Ruby
\curl -L https://get.rvm.io | bash -s stable

echo "source /etc/profile.d/rvm.sh" | tee -a /home/ec2-user/.bash_profile
echo "source /etc/profile.d/rvm.sh" | tee -a /root/.bash_profile

source /etc/profile.d/rvm.sh

sudo usermod -a -G rvm ec2-user

rvm requirements
rvm install ruby
rvm use ruby --default
rvm rubygems current

# ignore warnings
rvm rvmrc warning ignore all.rvmrcs

# installing passenger
gem install passenger
passenger-install-apache2-module --auto

# creating instalation directory
sudo mkdir /srv/www

sudo chgrp -R ec2-user /srv/www
sudo chmod -R 775 /srv/www
sudo chown -R ec2-user /srv/www/

# IMPORTANT - check the path to use the correct passanger and ruby versions
# adding passenger module to apache
echo 'LoadModule passenger_module /usr/local/rvm/gems/ruby-2.1.3/gems/passenger-4.0.53/buildout/apache2/mod_passenger.so
<IfModule mod_passenger.c>
 PassengerRoot /usr/local/rvm/gems/ruby-2.1.3/gems/passenger-4.0.53
 PassengerDefaultRuby /usr/local/rvm/gems/ruby-2.1.3/wrappers/ruby
</IfModule>' | sudo tee -a /etc/httpd/conf/httpd.conf

# configuring trampolim app
echo '<VirtualHost *:80>
  ServerName trampolim
  DocumentRoot /srv/www/trampolim/current/public
  <Directory /srv/www/trampolim/current/public>
     # This relaxes Apache security settings.
     AllowOverride all
     # MultiViews must be turned off.
     Options -MultiViews
     # Uncomment this if youre on Apache >= 2.4:
     #Require all granted
  </Directory>
</VirtualHost>' > /etc/httpd/conf.d/trampolim.conf

# starting apache
sudo service httpd restart
chkconfig httpd on

# install postgres
sudo yum -y install postgresql postgresql-server postgresql-devel postgresql-contrib postgresql-docs
sudo service postgresql initdb
# Use MD5 Authentication
sudo sed -i.bak -e 's/ident$/md5/' -e 's/peer$/md5/' /var/lib/pgsql9/data/pg_hba.conf
#start
sudo /sbin/chkconfig --levels 235 postgresql on
sudo service postgresql start
 

sudo reboot
```