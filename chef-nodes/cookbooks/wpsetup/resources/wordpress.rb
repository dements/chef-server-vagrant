action :install do

  template '/var/www/html/wp-config.php' do
  	source 'wp-config.php.erb'
  	owner 'apache'
  	group 'apache'
  	mode '0755'
  end

  remote_file '/home/vagrant/latest.tar.gz' do
  	source 'http://wordpress.org/latest.tar.gz'
  	owner 'vagrant'
  	group 'vagrant'
  	mode '0755'
  end

  execute 'unpack wp' do
  	command 'sudo tar --strip 1 -xzvf /home/vagrant/latest.tar.gz -C /var/www/html/ wordpress'
  end

end
