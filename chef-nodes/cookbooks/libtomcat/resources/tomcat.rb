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

  package 'java-1.8.0-openjdk.x86_64' do
    action :install
    flush_cache( {:after => true} )
  end

  package 'tomcat' do
    action :install
    flush_cache( {:after => true} )
  end

  service 'tomcat' do
    action [:enable, :start]
  end
end
