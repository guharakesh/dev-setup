require 'json'

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.network :forwarded_port, host: 3000, guest: 80

  config.vm.synced_folder "./", "/vagrant", id: "vagrant-root"

end
