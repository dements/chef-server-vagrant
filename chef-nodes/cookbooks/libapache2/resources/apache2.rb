property :conf_path, String, required: true
property :template_source, String, required: true
property :template_owner, String, default 'root'
property :template_group, String, default 'root'
property :fmode, String, default '0755'

action :install do
  package 'httpd' do
    action :install
  end

  template new_resource.conf_path do
    source new_resource.template_source
    owner new_resource.template_owner
    group new_resource.template_group
    mode new_resource.fmode
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
