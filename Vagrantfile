# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"
  config.vm.box_check_update = true

  config.vm.define "raspi", primary: true do |raspi|
    raspi.vm.network "private_network", ip: "192.168.33.10"
    raspi.ssh.forward_agent = true
  end

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.cpus = 1
    vb.memory = "512"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "site.yml"
    ansible.groups = {
        "fluentd_server" => ["raspi"]
    }
  end

  # todo: serverspec

end
