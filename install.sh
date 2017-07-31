sudo su 
apt-get update

DBNAME=blackladder
DBUSER=vagrant
DBPASSWD=vagrant

# git nginx
apt-get install -y git vim nginx >> /vagrant/vm_build.log 2>&1

# Nginx
rm -rf /usr/share/nginx/html
ln -fs /vagrant /usr/share/nginx/html

# memcached
# apt-get install memcached

# mysql
debconf-set-selections <<< "mysql-server mysql-server/root_password password $DBPASSWD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DBPASSWD"

apt-get -y install mysql-server >> /vagrant/vm_build.log 2>&1

echo -e "\n--- Setting up our MySQL user and db ---\n"
sudo mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME" >> /vagrant/vm_build.log 2>&1
sudo mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'localhost' identified by '$DBPASSWD'" >> /vagrant/vm_build.log 2>&1

# flask
apt-get -y install python3-pip
sudo apt-get install python-pip python-dev libmysqlclient-dev MySQL-python >> /vagrant/vm_build.log 2>&1
sudo pip3 install flask 

export FLASK_APP=/vagrant/app.py
export FLASK_DEBUG=1
cd /vagrant
pip3 install -r requirements.txt
# python3 -m flask run --host=0.0.0.0
