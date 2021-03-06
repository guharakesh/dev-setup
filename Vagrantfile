Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, host: 3000, guest: 80
	config.vm.network :forwarded_port, host: 3333, guest: 8100 
	config.vm.network :forwarded_port, host: 35729, guest: 35729

	config.ssh.private_key_path = ["~/.vagrant.d/insecure_private_key", "~/.ssh/id_rsa"]
	config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    # This allows symlinks to be created within the /vagrant dir
    vb.customize [
      "setextradata", :id,
      "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"
    ]
		vb.customize ["modifyvm", :id, "--usb", "on"]
		vb.customize ["usbfilter", "add", "0", "--target", :id, "--name", "android", "--vendorid", "0x18d1"]
  end

  # install puppet and librarian-puppet
  config.vm.provision :shell, :path => "shell/install-puppet.sh"
  config.vm.provision :shell, :path => "shell/install-librarian-puppet.sh"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "default.pp"
  end

  config.vm.provision :shell, :path => "shell/config-vim.sh"
  config.vm.provision :shell, :path => "shell/install-ionic.sh"
  
	config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
	# config.vm.provision "file", source: "shell/vimrc", destination: ".vimrc"
	config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: ".ssh/id_rsa.pub"
end
