sudo yum -y update

sudo yum -y groupinstall 'Development Tools'

curl -sL https://rpm.nodesource.com/setup_12.x | sudo bash -
sudo yum install -y nodejs

curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo yum install -y yarn
yarn install --check-files

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile

git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv rehash

rbenv install 2.6.5
rbenv global 2.6.5
rbenv rehash

sudo amazon-linux-extras enable lamp-mariadb10.2-php7.2
sudo yum install -y mariadb mariadb-server mariadb-devel

sudo systemctl start mariadb
sudo systemctl status mariadb

sudo mkdir /var/www
sudo chown `whoami` /var/www
cd /var/www

sudo amazon-linux-extras install nginx1

sudo systemctl start nginx.service
