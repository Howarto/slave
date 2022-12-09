Vagrant.configure( '2' ) do | config |
  config.vagrant.plugins = [ 'vagrant-hostmanager' ]

  config.vm.provider 'virtualbox' do | vb |
      vb.memory = '4096'
  end

  # Debian 11 Bullseye.
  config.vm.box = 'generic/debian11'

  # Be careful, static IP can cause collisions with others.
  # config.vm.network 'private_network', ip: '192.168.10.10'

  # Hosts managemenet.
  config.vm.provision :hostmanager
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true
  config.hostmanager.aliases = [ 'debian.local' ]

  # Dev tools to run set up scripts.
  config.vm.provision :shell, :inline => 'apt install ansible -y', :run => :once
end
