execute 'update-upgrade' do
	command 'sudo yum update -y'
	action :run
end

wpsetup_apache2 'apache' do
  action :install
end

wpsetup_phpinstall 'php' do
  action :install
end

wpsetup_wordpress 'wp' do
  action :install
end

wpsetup_apache2 'reload_apache' do
	acrion :reload
end
