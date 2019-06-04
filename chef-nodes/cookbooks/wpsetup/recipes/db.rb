
libmysql_mysqlinstall 'install mysql community server' do
  mysql_repo 'http://repo.mysql.com/yum/mysql-cluster-7.5-community/el/7/x86_64/mysql57-community-release-el7-10.noarch.rpm'
  filepath '/home/vagrant/mysql.rpm'
  fileowner 'vagrant'
  filegroup 'vagrant'
  action :install
end
