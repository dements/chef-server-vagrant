execute 'update-upgrade' do
  command 'sudo yum update -y'
  action :run
end

libapache2_apache2 'apache' do
  conf_path '/etc/httpd/conf/httpd.conf'
  filesource 'httpd.conf.erb'
  fileowner 'root'
  filegroup 'root'
  filemode '0755'
  action :install
end

libphp_php 'php' do
  action :install
end

# wpsetup_wordpress 'wp' do
#   action :install
# end

template '/var/www/html/wp-config.php' do
  source 'wp-config.php.erb'
  owner 'apache'
  group 'apache'
  variables(
    db_name: 'wpdb',
    db_user: 'wpadmin',
    db_password: 'wordpress123',
    db_host: '10.128.236.152',
    db_charset: 'utf8',
  )
  action :create
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

libapache2_apache2 'reload_apache' do
  action :reload
end
