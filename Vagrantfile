VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # This value should match any private box or one from Vagrant cloud catalog
  config.vm.box = "geerlingguy/ubuntu1604"
  config.vm.network :private_network, ip: "192.168.56.10"
  config.ssh.insert_key = false

  config.vm.hostname = "ansvagrant.test"
  config.vm.provider :virtualbox do |v|
    v.name = "ansvagrant.test"
    v.memory = 1024
    v.cpus = 2
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  # Enable provisioning with Ansible.
  config.vm.provision "ansible" do |ansible|
    ansible.compatibility_mode = "2.0"
    ansible.playbook = "provisioning/main.yml"
  end

end
