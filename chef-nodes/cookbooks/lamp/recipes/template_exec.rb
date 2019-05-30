apache_config_dir = '/etc/httpd/conf'

directory apache_config_dir do
  owner 'root'
  group 'root'
  recursive true
end

template '/etc/httpd/conf/httpd.conf' do
	source 'httpd.conf.erb'
	owner 'root'
	group 'root'
	mode '0755'
end
