#!/bin/sh
vagrant up
cd microservice-consul/microservice-consul-demo
./mvnw -DskipTests -DdownloadSources=true -DdownloadJavadocs=true -q clean package
cd ..
cd ..
cd user-registration-V2/user-registration-application
./mvnw -DskipTests -DdownloadSources=true -DdownloadJavadocs=true -q clean package
