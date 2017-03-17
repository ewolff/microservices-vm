Microservice VM
==============

This project creates a VM with the Microservices project and the
Continuous Delivery example. It is useful for workshops etc. The VM
uses 4.5GB of RAM and 2 CPUs. Therefore it needs some ressources. Please
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
ubuntu@ubuntu-xenial:~$ docker images
REPOSITORY                      TAG                 IMAGE ID            CREATED              SIZE
loganalysis_kibana              latest              365a5f410b52        About a minute ago   113 MB
loganalysis_user-registration   latest              36c816948a07        2 minutes ago        193 MB
loganalysis_logstash            latest              59e5a1e6cbbf        2 minutes ago        301 MB
loganalysis_elasticsearch       latest              54cf8beb3a88        3 minutes ago        202 MB
graphite_graphite-web           latest              b4711061b6ad        3 minutes ago        234 MB
graphite_user-registration      latest              ab647214b3dd        4 minutes ago        193 MB
graphite_carbon                 latest              9a458e2f67b0        4 minutes ago        202 MB
ms_order                        latest              73f03167b43a        5 minutes ago        232 MB
ms_turbine                      latest              d25c19515e8d        5 minutes ago        213 MB
ms_catalog                      latest              a29e56322ebf        5 minutes ago        231 MB
ms_customer                     latest              892f98a767c3        5 minutes ago        231 MB
ms_zuul                         latest              b5ad2bc1c038        5 minutes ago        213 MB
ms_eureka                       latest              930ba9cec258        5 minutes ago        213 MB
alpine                          3.2                 9d2a09b6323c        13 days ago          5.26 MB
ewolff/docker-java              latest              27b031f90fda        5 weeks ago          167 MB
ubuntu                          15.04               d1b55fd07600        13 months ago        131 MB
```

Finally you can shutdown the VM using `vagrant halt` and start again
using `vagrant up`.

To get rid of the setup run clean.sh
