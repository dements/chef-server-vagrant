epelrepo = '/home/vagrant/epel.rpm'

action :install do

  remote_file epelrepo do
    source 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm'
    owner 'vagrant'
    group 'vagrant'
    mode '0755'
  end

  package epelrepo do
    action :install
  end

  package 'nginx' do
    action :install
  end

  service 'nginx' do
    action [:enable, :start]
  end
  
end
