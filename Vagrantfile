Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "forwarded_port", guest: 8500, host: 8500, host_ip: "127.0.0.1"     # Consul
  config.vm.network "forwarded_port", guest: 5601, host: 5601, host_ip: "127.0.0.1"     # Kibana for Log Analysis
  config.vm.network "forwarded_port", guest: 8080, host: 8080, host_ip: "127.0.0.1"     # User Registration for Log Analysis
  config.vm.network "forwarded_port", guest: 8989, host: 8989, host_ip: "127.0.0.1"     # Hystrix
  config.vm.network "forwarded_port", guest: 8082, host: 8082, host_ip: "127.0.0.1"     # Graphite
  config.vm.provider "virtualbox" do |v|
    v.memory = 4500
    v.cpus = 2
  end

  $script = <<SCRIPT
# install Docker
sudo apt-get -y -qq install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" >> /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get dist-upgrade -y -qq 
sudo apt-get purge -y -qq lxc-docker
sudo apt-get install -y -qq git docker-engine openjdk-8-jre-headless openjdk-8-jdk
sudo update-ca-certificates -f
sudo service docker start
sudo groupadd docker
sudo usermod -aG docker ubuntu

# install Docker Compose
cd
curl -sS -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` > docker-compose
sudo mv docker-compose /usr/local/bin/
sudo chmod +x /usr/local/bin/docker-compose

cd /vagrant/
sudo -u vagrant git clone -q https://github.com/ewolff/microservice-consul.git
cd /vagrant/microservice-consul/microservice-consul-demo
sudo -u vagrant ./mvnw -DskipTests -DdownloadSources=true -DdownloadJavadocs=true -q clean package
cd /vagrant/microservice-consul/docker
sudo docker-compose build
sudo docker-compose pull

cd /vagrant/
sudo -u vagrant git clone -q https://github.com/ewolff/user-registration-V2.git
cd user-registration-V2
cd user-registration-application
sudo -u vagrant ./mvnw -DskipTests -DdownloadSources=true -DdownloadJavadocs=true -q package
cd ..
cd /vagrant/user-registration-V2/graphite/
sudo docker-compose build
sudo docker-compose pull
cd ..
cd log-analysis
sudo docker-compose build
sudo docker-compose pull

SCRIPT
  
  config.vm.provision "shell", inline: $script
  
end
