execute 'install apache' do
	command 'sudo yum install -y httpd'	
end

execute 'start apache service' do
	command 'sudo systemctl enable httpd'
	command 'sudo systemctl start httpd'
end
