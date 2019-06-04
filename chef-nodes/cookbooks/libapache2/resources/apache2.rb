property :conf_path, String, required: true
property :filesource, String, required: true
property :fileowner, String, required: true
property :filegroup, String, required: true
property :filemode, String, required: true

action :install do
  package 'httpd' do
    action :install
  end

  template new_resource.conf_path do
    source new_resource.filesource
    owner new_resource.fileowner
    group new_resource.filegroup
    mode new_resource.filemode
    action :create
  end

  service 'httpd' do
    action [:enable, :start]
  end
end

action :reload do
  service 'httpd' do
    action :restart
  end
end
