# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.hostname = 'localhost'
  config.vm.box      = 'ubuntu/trusty64'
  # config.vm.box_url  = "http://192.168.1.121/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.provider "virtualbox" do |vb|
    # vb.gui = true
    vb.memory = 2048
    # vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/projects", "1"]
  end

  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true
end
