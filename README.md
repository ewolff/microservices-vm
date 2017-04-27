Microservice VM
==============

This project creates a VM with the Microservices project https://github.com/innoq/microservice-consul and the
Continuous Delivery example https://github.com/innoq/user-registration-V2/. It is useful for workshops etc. 
Please see the project READMEs for further details on the samples.
The VM uses 4.5GB of RAM and 2 CPUs. Therefore it needs some ressources. Please
also note that a lot of software is installed on these machine i.e. it
will take quite a while to install and it will download considerable
amounts of data.

To run it:

- Install Virtual Box from https://www.virtualbox.org/wiki/Downloads
- Install Vagrant as discussed at
http://docs.vagrantup.com/v2/installation/index.html
- Run `build.sh` from the current directory (Linux / Mac OS X). If you
  are using Windows: run `build.cmd` instead.

To check the installation:

- There should be no errors displayed.... ;-)
- Enter `vagrant ssh` to login to the VM. If you use Windows, please
  refer to https://gist.github.com/haf/2843680 to get ssh working.
- `docker images` should return:
```
vagrant@vagrant-ubuntu-wily-64:~$ docker images
REPOSITORY                      TAG                 IMAGE ID            CREATED             SIZE
loganalysis_kibana              latest              b9127aec0259        35 seconds ago      113MB
loganalysis_user-registration   latest              99823c7c8983        2 minutes ago       193MB
loganalysis_logstash            latest              649e63eef8d3        2 minutes ago       301MB
loganalysis_elasticsearch       latest              f7f74666147d        4 minutes ago       202MB
graphite_graphite-web           latest              c0322c1449f8        6 minutes ago       234MB
graphite_user-registration      latest              ef6db0b00f51        6 minutes ago       193MB
graphite_carbon                 latest              547f63b7868b        7 minutes ago       202MB
msconsul_order                  latest              19b36f9e498c        13 minutes ago      221MB
msconsul_turbine                latest              24c39bfb76f7        13 minutes ago      209MB
msconsul_apache                 latest              8bdd02bcc1d2        13 minutes ago      288MB
msconsul_catalog                latest              516606f53ad3        16 minutes ago      220MB
msconsul_customer               latest              84629be9ac93        16 minutes ago      220MB
alpine                          3.2                 9d2a09b6323c        7 weeks ago         5.26MB
ewolff/docker-java              latest              27b031f90fda        2 months ago        167MB
consul                          v0.6.4              b0971c9ec426        6 months ago        32.4MB
ubuntu                          15.04               d1b55fd07600        15 months ago       131MB
```

Finally you can shutdown the VM using `vagrant halt` and start again
using `vagrant up`.

To get rid of the setup run `clean.sh`.
