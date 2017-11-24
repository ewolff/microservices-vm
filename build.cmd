@echo off

vagrant up

cd microservice-consul\microservice-consul-demo
call mvnw.cmd -DskipTests -DdownloadSources=true -DdownloadJavadocs=true -q clean package

cd ..\..

cd user-registration-V2\user-registration-application
call mvnw.cmd -DskipTests -DdownloadSources=true -DdownloadJavadocs=true -q clean package
