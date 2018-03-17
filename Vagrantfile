# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
set -eux
apt-get install -y python-pip
pip install --upgrade pip
SCRIPT


Vagrant.configure("2") do |config|
  config.vm.box = 'ubuntu/xenial64'

  config.vm.network "private_network", type: "dhcp"
  config.vm.synced_folder "./", "/etc/ansible/roles/ndench.fakes3", type: "nfs", mount_options: ["tcp", "actimeo=2"]

  config.vm.provision "shell", inline: $script, privileged: true

  config.vm.provision "ansible_local" do |ansible|
    ansible.compatibility_mode = "2.0"
    ansible.galaxy_role_file = "tests/requirements.yml"
    #ansible.galaxy_roles_path = "/home/ubuntu/.ansible/roles"
    ansible.playbook = "tests/main.yml"
    ansible.verbose = 'vv'
    ansible.become = true
  end
end
