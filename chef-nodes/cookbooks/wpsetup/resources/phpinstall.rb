action :install do

	execute 'add repos for php73' do
		command 'sudo yum -y localinstall --nogpgcheck http://rpms.famillecollet.com/enterprise/remi-release-7.rpm'
		action :run
	end

	execute 'add repos-epel' do
		command 'sudo yum -y localinstall --nogpgcheck http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm'
		action :run
	end

	execute 'set php version to 73' do
		command 'sudo yum-config-manager --enable remi-php73'
		action :run
	end

	execute 'php-install' do
		command 'sudo yum install -y php php-mysql php-devel php-gd php-pecl-memcache php-pspell php-snmp php-xmlrpc php-xml'
		action :run
	end

end
