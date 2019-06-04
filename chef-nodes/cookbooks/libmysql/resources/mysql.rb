property :mysql_repo, String, required: true
property :filepath, String, required: true
property :fileowner, String, required: true
property :filegroup, String, required: true

action :install do
  remote_file new_resource.filepath do
  	source new_resource.mysql_repo
  	owner new_resource.fileowner
  	group new_resource.filegroup
  end

  yum_package new_resource.filepath do
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
