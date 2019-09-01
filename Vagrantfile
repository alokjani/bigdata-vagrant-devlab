# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
 
  config.vm.synced_folder ".", "/vagrant", type: 'virtualbox'   
  config.vm.define :master do |master|
    master.vm.box = "centos/7"
    master.vm.network :private_network, ip: "192.168.33.10"
    master.vm.hostname = "hadoop-aio"
    
    master.vm.provider "virtualbox" do |v|
      v.name = "hadoop-aio"
      v.customize ["modifyvm", :id, "--memory", "4096"]
    end

  end
end
