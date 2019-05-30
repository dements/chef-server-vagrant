wp_config_dir = '/var/www/html'
execute 'install apache' do
	command 'sudo yum install -y php php-mysql php-devel php-gd php-pecl-memcache php-pspell php-snmp php-xmlrpc php-xml'
end


directory wp_config_dir do
	owner 'apache'
	group 'apache'
	recursive true
end

template '/var/www/html/wp-config.php' do
	source 'wp-config.php.erb'
	owner 'apache'
	group 'apache'
	mode '0755'
end

#'https://www.php.net/distributions/php-7.3.5.tar.gz'

remote_file '/home/vagrant/latest.tar.gz' do
	source 'http://wordpress.org/latest.tar.gz'
	owner 'vagrant'
	group 'vagrant'
	mode '0755'
end

execute 'unpack wp' do
	command 'sudo tar --strip 1 -xzvf /home/vagrant/latest.tar.gz -C /var/www/html/ wordpress'
end
