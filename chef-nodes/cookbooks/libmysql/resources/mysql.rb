property :mysql_repo, String, required: true
property :mysql_package, String, required: true
property :pkgowner, String, required: true

action :install do
  remote_file new_resource.filepath do
  	source new_resource.mysql_repo
  	owner new_resource.pkgowner
  end

  yum_package new_resource.mysql_package do
    action :install
  end

  package 'mysql-community-server' do
    action :install
  end

  service 'mysqld' do
    action :start
  end
end

action :reload do
  service 'mysqld' do
    action :restart
  end
end
