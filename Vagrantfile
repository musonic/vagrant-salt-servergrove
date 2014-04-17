Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.network :forwarded_port, host: 4567, guest: 80

  ## For masterless, mount your file roots file root
  config.vm.synced_folder "salt/roots/", "/srv/", 
    :owner => "vagrant",
    :group => "www-data",
    :mount_options => ["dmode=775","fmode=664"]
  config.vm.synced_folder ".", "/vagrant", 
    :owner => "vagrant",
    :group => "www-data",
    :mount_options => ["dmode=775","fmode=664"]


  ## Set your salt configs here
  config.vm.provision :salt do |salt|

    ## Minion config is set to ``file_client: local`` for masterless
    salt.minion_config = "salt/minion"

    ## Installs our example formula in "salt/roots/salt"
    salt.run_highstate = true

  end

end