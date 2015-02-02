Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, host: 3000, guest: 80

  config.vm.provider :virtualbox do |vb|
    # This allows symlinks to be created within the /vagrant dir
    vb.customize [
      "setextradata", :id,
      "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"
    ]
  end

  # install puppet and librarian-puppet
  config.vm.provision :shell, :path => "shell/install-puppet.sh"
  config.vm.provision :shell, :path => "shell/install-librarian-puppet.sh"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "default.pp"
  end
end
