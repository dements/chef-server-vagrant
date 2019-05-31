action :install do

	package 'httpd' do
		action :install
	end

	template '/etc/httpd/conf/httpd.conf' do
		source 'httpd.conf.erb'
		owner 'root'
		group 'root'
		mode '0755'
		action :create
	end

	execute 'enable httpd' do
		command 'sudo systemctl enable httpd'
	end

	execute 'start httpd' do
		command 'sudo systemctl start httpd'
	end

end

actioin :reload do

	execute 'restart httpd' do
		command 'sudo systemctl restart httpd'
	end

end
