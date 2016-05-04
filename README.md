Microservice VM
==============

This project creates a VM with the Microservices project and the
Continuous Delivery example. It is useful for workshops etc. The VM
uses 3GB of RAM and 2 CPUs. Therefore it needs some ressources. Please
also note that a lot of software is installed on these machine i.e. it
will take quite a while to install and it will download considerable
amounts of data.

To run it:

- Install Virtual Box from https://www.virtualbox.org/wiki/Downloads
- Install Vagrant as discussed at
http://docs.vagrantup.com/v2/installation/index.html
- Run `build.sh` from the current directory. If you are using Windows:
Take a look at the script. It should be easy to do the same steps manually.

To check the installation:

- There should be no errors displayed.... ;-)
- Enter `vagrant ssh` to login to the VM
- `docker images` should return:
```
vagrant@vagrant-ubuntu-wily-64:~$ docker images
REPOSITORY                      TAG                 IMAGE ID            CREATED              SIZE
loganalysis_kibana              latest              66f3279135ac        About a minute ago   113.4 MB
loganalysis_user-registration   latest              7c4f565e8373        2 minutes ago        192.3 MB
loganalysis_logstash            latest              901e2349181f        2 minutes ago        300.1 MB
loganalysis_elasticsearch       latest              a373a19554fa        5 minutes ago        203.7 MB
graphite_graphite-web           latest              9c7130991b28        7 minutes ago        233.6 MB
graphite_user-registration      latest              c422e68e0aed        10 minutes ago       192.3 MB
graphite_carbon                 latest              757ada0490bc        10 minutes ago       202.2 MB
docker_order                    latest              88a0973a0a5f        20 minutes ago       206.7 MB
docker_turbine                  latest              1abf6869c53d        20 minutes ago       197.3 MB
docker_catalog                  latest              2fa3b8e9f2e8        20 minutes ago       206.9 MB
docker_customer                 latest              f5464e31ffce        20 minutes ago       206.9 MB
docker_zuul                     latest              3f666bfa18d3        20 minutes ago       194.1 MB
docker_eureka                   latest              5aa964ca4c1d        21 minutes ago       203.7 MB
alpine                          3.2                 e516c982313c        4 weeks ago          5.253 MB
ubuntu                          15.04               d1b55fd07600        3 months ago         131.3 MB
ewolff/docker-java              latest              051556b239ed        9 months ago         167 MB
```

Finally you can shutdown the VM using `vagrant halt` and start again
using `vagrant up`.
