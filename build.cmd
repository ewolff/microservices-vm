@echo off

vagrant up

cd microservice-consul\microservice-consul-demo
call ..\..\apache-maven-3.3.9\bin\mvn.cmd -DskipTests -DdownloadSources=true -DdownloadJavadocs=true -q clean package

cd ..\..

cd user-registration-V2\user-registration-application
call ..\..\apache-maven-3.3.9\bin\mvn.cmd -DskipTests -DdownloadSources=true -DdownloadJavadocs=true -q clean package
