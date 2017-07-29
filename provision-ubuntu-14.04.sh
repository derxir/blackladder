sudo su
apt-get update

# oh-my-zsh
echo "==================== "
echo "oh-my-zsh installing ... "
echo "==================== "
apt-get install -y git
apt-get install -y curl
apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
zsh
apt-get install -y vim

# Apache
# apt-get install -y apache2 apache2-utils
# a2enconf fqdn
# a2enmod rewrite
# a2dissite 000-default.conf
# rm -rf /var/www
# ln -fs /vagrant /var/www

# Nginx
echo "==================== "
echo "Nginx installing ... "
echo "==================== "
apt-get install -y nginx 
rm -rf /usr/share/nginx/www
ln -fs /vagrant /usr/share/nginx/www
service nginx start

# memcached
apt-get install memcached

# python3.5.1
echo "==================== "
echo "Python 3.5.1 installing ... "
echo "===================="
set -e

if [ -x /usr/local/bin/python3.5 ]; then
  echo 'Skipping Python installation since Python 3.5 is already installed.'
else
  echo 'Install required libraries...'
  apt-get update -yq
  apt-get install -yq libreadline-dev libsqlite3-dev libssl-dev

  echo 'Install Python 3.5...'
  cd /tmp
  wget -O- https://www.python.org/ftp/python/3.5.1/Python-3.5.1.tgz | tar xz
  cd Python-3.5.1
  ./configure
  make
  make altinstall

  echo 'Clean up...'
  cd && rm -rf /tmp/Python-3.5.1

  echo 'Done!'
fi

