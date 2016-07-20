# vim: syntax=ruby

servername = 'osticket'
base_box = 'ubuntu/trusty64'

Vagrant.configure(2) do |config|
  config.vm.define servername do |c|
    if Vagrant.has_plugin?("vagrant-vbguest")
      c.vbguest.auto_update = false
    end

    # basic options
    c.vm.box = base_box
    c.vm.hostname = "#{servername}.local"

    # Networking
    c.vm.network "forwarded_port", guest: 80, host: 8080                                # port forward

    # Virtual Box Settings
    c.vm.provider "virtualbox" do |vb|
      vb.gui = false        # false = start headless
      vb.memory = "2048"
      vb.name = servername
      vb.customize [
        "modifyvm", :id,
        "--cpus", "4"
      ]
    end
    c.vm.provision "shell", path: "./bootstrap.sh"
  end
end
