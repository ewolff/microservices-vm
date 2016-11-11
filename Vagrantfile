Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/wily64"
  config.vm.network "forwarded_port", guest: 2003, host: 12003     # Carbon for Graphite
  config.vm.network "forwarded_port", guest: 8082, host: 18082     # Graphite Web for Graphite
  config.vm.network "forwarded_port", guest: 8083, host: 18083     # User Registration for Graphite

  config.vm.network "forwarded_port", guest: 5601, host: 15601     # Kibana for Log Analysis
  config.vm.network "forwarded_port", guest: 8080, host: 18080     # User Registration for Log Analysis
  config.vm.network "forwarded_port", guest: 9200, host: 19200     # Elasticsearch for Log Analysis

                                                                  # User Registration for Microservices also uses port 8080
  config.vm.network "forwarded_port", guest: 8761, host: 18761     # Eureka for Microservices
  config.vm.network "forwarded_port", guest: 8989, host: 18989     # Hystrix Dashboard for Microservices
  config.vm.provider "virtualbox" do |v|
    v.memory = 4500
    v.cpus = 2
  end

  $script = <<SCRIPT
# install Docker
sudo apt-get -y -qq install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo echo "deb https://apt.dockerproject.org/repo ubuntu-wily main" >> /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get dist-upgrade -y -qq 
sudo apt-get purge -y -qq lxc-docker
sudo apt-get install -y -qq docker-engine openjdk-8-jre-headless openjdk-8-jdk
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
