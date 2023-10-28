# -*- mode: ruby -*-
# vi: set ft=ruby :
#

PUPPETSERVER_IP="192.168.15.2"
PUPPETAGENT_IP="192.168.15.3"

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "generic/centos8"

  config.vm.define 'puppet' do |puppet|
    puppet.vm.hostname = 'puppet.localdomain'
    puppet.vm.network "private_network", ip: PUPPETSERVER_IP
    puppet.vm.synced_folder ".", "/vagrant", disabled: true

    puppet.vm.provider :virtualbox do |v|
      v.memory = 4096
    end

    puppet.vm.provision "shell", inline: <<-SHELL
      rpm -Uvh https://yum.puppet.com/puppet8-release-el-8.noarch.rpm
      yum update -y
      yum -y install git vim-enhanced tree puppetserver
      echo 'export PATH=$PATH:/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin' >> /root/.bashrc
      firewall-cmd --add-port=8140/tcp --permanent
      firewall-cmd --reload
      systemctl enable puppetserver
      systemctl start puppetserver
    SHELL
  end

  config.vm.define 'agent' do |agent|
    agent.vm.hostname = 'agent.localdomain'
    agent.vm.network "private_network", ip: PUPPETAGENT_IP
    agent.vm.synced_folder ".", "/vagrant", disabled: true
    agent.vm.provision "shell", inline: <<-SHELL
      rpm -Uvh https://yum.puppet.com/puppet8-release-el-8.noarch.rpm
      yum update -y
      yum -y install git vim-enhanced tree puppet-agent
      echo 'export PATH=$PATH:/opt/puppetlabs/puppet/bin' >> /root/.bashrc
      puppet config set server puppet --section main
      echo "#{PUPPETSERVER_IP} puppet" >> /etc/hosts
    SHELL
  end

end
