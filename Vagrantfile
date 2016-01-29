$enable_serial_logging = false
# -*- mode: ruby -*-
# vi: set ft=ruby :

# PHP Options
composer_packages     = [
  #"phpunit/phpunit:4.0.*",
  #"codeception/codeception=*",
  #"phpspec/phpspec:2.0.*@dev",
  #"squizlabs/php_codesniffer:1.5.*",
]

# Database Configuration
mysql_root_password   = "12345"   # We'll assume user "root"
mysql_version         = "5.6"    # Options: 5.5 | 5.6
mysql_enable_remote   = "false"  # remote access enabled when true


# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.


  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"



  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/fuck"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 80, host: 9999
  config.vm.network "forwarded_port", guest: 9200, host: 9300
  config.vm.network "forwarded_port", guest: 3306, host: 3307, protocol: 'tcp'
  config.vm.network "forwarded_port", guest: 27017, host: 27018, protocol: 'tcp'
  config.vm.network "forwarded_port", guest: 9501, host: 9502

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"
  #config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder ".", "/vagrant",:owner => "vagrant", :group => "vagrant",:mount_options => ["dmode=777","fmode=777"]
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
      vb.memory = "2048"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
      bash -c 'BASH_ENV=/etc/profile exec bash'
      sudo locale-gen en_US.UTF-8
      sudo localedef -i en_US -f UTF-8 en_US.UTF-8
      export LANGUAGE=en_US.UTF-8
      export LANG=en_US.UTF-8
      export LC_ALL=en_US.UTF-8
      source ~/.bashrc
      sudo apt-get update
      sudo apt-get install -y software-properties-common python-software-properties --force-yes
  SHELL

  # Provision PHP
  config.vm.provision "shell", path: "scripts/php.sh"

  # Provision Composer
  # You may pass a github auth token as the first argument
  # config.vm.provision "shell", path: "scripts/composer.sh", privileged: false, args: [composer_packages.join(" ")]

  # Provision Nginx Base
  config.vm.provision "shell", path: "scripts/nginx.sh"

  # Provision MySQL
  config.vm.provision "shell", path: "scripts/mysql.sh", args: [mysql_root_password, mysql_version, mysql_enable_remote]

  # Install Supervisord
  config.vm.provision "shell", path: "scripts/supervisord.sh"

  # Provision Redis (without journaling and persistence)
  config.vm.provision "shell", path: "scripts/redis.sh"

  # Provision Redis (without journaling and persistence)
  config.vm.provision "shell", path: "scripts/nodejs.sh"

  config.vm.provision "shell", path: "bootstrap.sh"
end
