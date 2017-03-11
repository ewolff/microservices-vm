#!/bin/sh
vagrant up
cd microservice-consul/microservice-consul-demo
../../apache-maven-3.3.9/bin/mvn -DskipTests -DdownloadSources=true -DdownloadJavadocs=true -q clean package
cd ..
cd ..
cd user-registration-V2
cd user-registration-application
../../apache-maven-3.3.9/bin/mvn -DskipTests -DdownloadSources=true -DdownloadJavadocs=true -q clean package
