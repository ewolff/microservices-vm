#!/bin/sh
vagrant up
cd microservice-consul/microservice-consul-demo
./mvnw -DskipTests -DdownloadSources=true -DdownloadJavadocs=true -q clean package
cd ..

