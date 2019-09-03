# # VARIABLES
# root_pass = 'Kw)mgb,s&4f3'
# rt_pass = 'rootROOT123'
# db_user = 'wpadmin'
# db_password = 'wordpress123'
#
# # libmysql_mysqlinstall 'install mysql community server' do
# #   mysql_repo 'http://repo.mysql.com/yum/mysql-cluster-7.5-community/el/7/x86_64/mysql57-community-release-el7-10.noarch.rpm'
# #   mysql_package '/home/vagrant/mysql.rpm'
# #   pkgowner 'vagrant'
# #   action :install
# # end
#
# bash 'create wpdb' do
#   code <<-EOF
#   /usr/bin/mysql -u root -h 127.0.0.1 -P 3306 -p#{Shellwords.escape(root_pass)} -D mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY #{Shellwords.escape(rt_pass)};"
#   echo 'CREATE DATABASE wpdb;' | /usr/bin/mysql -u root -h 127.0.0.1 -P 3306 -p#{Shellwords.escape(rt_pass)};
#   EOF
#   sensitive true
#   action :run
# end
#
# bash 'create user' do
#   code <<-EOF
#   /usr/bin/mysql -u root -h 127.0.0.1 -P 3306 -p#{Shellwords.escape(rt_pass)} -D mysql -e "CREATE USER 'wpadmin'@'localhost' IDENTIFIED BY #{Shellwords.escape(db_password)};"
#   /usr/bin/mysql -u root -h 127.0.0.1 -P 3306 -p#{Shellwords.escape(rt_pass)} -D mysql -e "GRANT ALL PERMISSIONS ON wpdb.* TO 'wpadmin'@'localhost';"
#   EOF
#   sensitive true
#   action :run
# end
