#
# Cookbook:: lamp
# Recipe:: default
#
# Copyright:: 2019, Sergii Dementiev, All Rights Reserved.

execute 'update-upgrade' do
	command 'sudo yum update -y'
	command 'sudo yum install -y wget'
end
