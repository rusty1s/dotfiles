HOST        = RbConfig::CONFIG["host_os"]
HOME        = ENV["HOME"]
DOTFILES    = ENV["DOTFILES"]
API_VERSION = "2"

Vagrant.configure(API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network :forwarded_port, guest: 8080, host: 8081
  config.vm.network :forwarded_port, guest: 40000, host: 8082
  config.vm.network :forwarded_port, guest: 9123, host: 8084
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.ssh.insert_key = false

  # configure proxy if necassary
  if Vagrant.has_plugin?("vagrant-proxyconf")
    if ENV["http_proxy"]
      config.proxy.http = ENV["http_proxy"]
    end
    if ENV["https_proxy"]
      config.proxy.https = ENV["https_proxy"]
    end
    if ENV["no_proxy"]
      config.proxy.no_proxy = ENV["no_proxy"]
    end
  end

  # give vm 1/2 system memory
  config.vm.provider "virtualbox" do |v|
    if HOST =~ /darwin/
      mem = `sysctl -n hw.memsize`.to_i / 1024
    elsif HOST =~ /linux/
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kb//'`.to_i
    elsif HOST =~ /mswin|mingw|cygwin/
      mem = `wmic computersystem Get TotalPhysicalMemory`.split[1].to_i / 1024
    end

    mem = mem / 1024 / 2
    v.customize ["modifyvm", :id, "--memory", mem]
  end

  # synced folders
  config.vm.synced_folder "#{DOTFILES}",   "/home/vagrant/dotfiles"
  config.vm.synced_folder "shared/",       "/home/vagrant/shared",                create: true

end
