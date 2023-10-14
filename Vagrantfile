Vagrant.configure( '2' ) do | config |
  config.vagrant.plugins = [ 'vagrant-vbguest', 'vagrant-hostmanager' ]

  config.vm.provider 'virtualbox' do | vb |
      vb.memory = '8192'
  end

  # Guest tools.
  # Fix bug ( https://github.com/dotless-de/vagrant-vbguest/issues/405 ).
  config.vbguest.installer_options = { running_kernel_modules: [ 'vboxguest' ] }

  # Debian 11 Bullseye.
  config.vm.box = 'generic/debian11'

  # Mount project.
  config.vm.synced_folder '.', '/vagrant'

  # (WARNING: can cause collisions with others) Static IP.
  config.vm.network 'private_network', ip: '192.168.10.10'

  # Allow using local public key for SSH connection.
  # ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
  # config.vm.provision :shell, :inline => "echo '#{ssh_pub_key}' >> /home/vagrant/.ssh/authorized_keys", :run => :once

  # Dev tools to run set up scripts.
  config.vm.provision :shell, :inline => 'apt install ansible -y', :run => :once

  # Hosts management.
  config.vm.provision :hostmanager
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true
  config.hostmanager.aliases = [ 'debian.local' ]
end
