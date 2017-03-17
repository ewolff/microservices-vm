Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 8500, host: 8500     # Consul
  config.vm.network "forwarded_port", guest: 5601, host: 5601     # Kibana for Log Analysis
  config.vm.network "forwarded_port", guest: 8080, host: 8081     # User Registration for Log Analysis
  config.vm.network "forwarded_port", guest: 8989, host: 8989     # Hystrix
  config.vm.network "forwarded_port", guest: 8082, host: 8082     # Graphite
  config.vm.provider "virtualbox" do |v|
    v.memory = 4500
    v.cpus = 2
  end

  $script = <<SCRIPT
# install Docker
sudo apt-get -y -qq install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get dist-upgrade -y -qq 
sudo apt-get purge -y -qq lxc-docker
sudo apt-get install -y -qq git docker-engine openjdk-8-jre-headless openjdk-8-jdk
sudo update-ca-certificates -f
sudo service docker start
sudo groupadd docker
sudo usermod -aG docker vagrant

# install Docker Compose
cd
curl -sS -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > docker-compose
sudo mv docker-compose /usr/local/bin/
sudo chmod +x /usr/local/bin/docker-compose

cd /vagrant/
sudo -u vagrant wget -nv http://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
sudo -u vagrant tar xzf apache-maven-3.3.9-bin.tar.gz
sudo -u vagrant echo export PATH=$PATH:/vagrant/apache-maven-3.3.9/bin >> /home/vagrant/.bashrc 

cd /vagrant/
sudo -u vagrant git clone -q https://github.com/innoq/microservice-consul.git
cd microservice-consul/microservice-consul-demo
sudo -u vagrant /vagrant/apache-maven-3.3.9/bin/mvn -DskipTests -DdownloadSources=true -DdownloadJavadocs=true -q package
cd ..
cd docker
sudo -u vagrant docker-compose build

cd /vagrant/
sudo -u vagrant git clone -q https://github.com/innoq/user-registration-V2.git
cd user-registration-V2
cd user-registration-application
sudo -u vagrant /vagrant/apache-maven-3.3.9/bin/mvn -DskipTests -DdownloadSources=true -DdownloadJavadocs=true -q package
cd ..
cd graphite
sudo -u vagrant docker-compose build
cd ..
cd log-analysis
sudo -u vagrant docker-compose build

SCRIPT
  
  config.vm.provision "shell", inline: $script
  
end
