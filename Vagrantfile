# -*- mode: ruby -*-
# vi: set ft=ruby :

source_directory = '/usr/local/htdocs'

Vagrant.configure("2") do |config|
  
  config.vm.box = "ncsu-centos-6.2-64bit-puppet"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 1536]
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/SHARE_NAME", "1"]
  end

  config.vm.box_url = "http://webapps.ncsu.edu/vagrant/ncsu-centos-6.2-64bit-puppet.box"

  config.vm.network :forwarded_port, guest: 80, host: 80
  config.vm.network :forwarded_port, guest: 3306, host: 3306
  
  config.vm.network :private_network, ip: "192.168.33.10"
   
  config.vm.synced_folder source_directory, "/var/www/html/", :nfs => true
 
  config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file  = "configure.pp"
      puppet.options = [
        '--verbose',
        '--debug',
        # '--graph',
        # '--graphdir=/vagrant/puppet/graphs'
      ]
  end
end