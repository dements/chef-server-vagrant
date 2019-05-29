
Vagrant.configure('2') do |config|
  config.vm.provider :virtualbox do |virtualbox|
    virtualbox.memory = 1024
    virtualbox.cpus = 2
  end

  config.vm.box = 'centos/7'
  config.vm.hostname = 'chef.srv.local'
  config.vm.network :public_network, bridge: 'Ethernet'
  config.vm.synced_folder "./scripts", "/opt/install", create: true

  #config.vm.provision "shell", inline: "sudo yum install -y mc"
  config.vm.provision "shell", path: "./scripts/install.sh"
end
