Vagrant.configure(2) do |config|
  config.vm.provision "shell", path: "pre.sh"

  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/jammy64"
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "192.168.56.5"
    master.vm.provider "virtualbox" do |vb|
    #master.vm.provision "shell", path: "pre.sh"
      vb.memory = 2048
    end
  end

  config.vm.define "worker1" do |worker1|
    worker1.vm.box = "ubuntu/jammy64"
    worker1.vm.hostname = "worker1"
    worker1.vm.network "private_network", ip: "192.168.56.6"
    worker1.vm.provider "virtualbox" do |vb|
    #worker1.vm.provision "shell", path: "pre.sh"
      vb.memory = 2048
    end
  end

  config.vm.define "worker2" do |worker2|
    worker2.vm.box = "ubuntu/jammy64"
    worker2.vm.hostname = "worker2"
    worker2.vm.network "private_network", ip: "192.168.56.7"
    worker2.vm.provider "virtualbox" do |vb|
    #worker2.vm.provision "shell", path: "pre.sh"
      vb.memory = 2048
    end
  end

  config.vm.define "worker3" do |worker3|
    worker3.vm.box = "ubuntu/jammy64"
    worker3.vm.hostname = "worker3"
    worker3.vm.network "private_network", ip: "192.168.56.8"
    worker3.vm.provider "virtualbox" do |vb|
    #worker3.vm.provision "shell", path: "pre.sh"
      vb.memory = 2048
    end
  end

#  config.vm.define "win10" do |win10|
#    win10.vm.box = "gusztavvargadr/windows-10"
#    win10.vm.hostname = "win10"
#    win10.vm.network "private_network", ip: "192.168.56.9"
#    win10.vm.provider "virtualbox" do |vb|
#      vb.memory = 4096
#      vb.cpus = 3
#    end
#  end  
end

