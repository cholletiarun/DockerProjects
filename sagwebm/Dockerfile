#Speciify Base Image.
FROM store/softwareag/webmethods-microservicesruntime:10.5

#switch user to root
USER root

#Download and isntall dependency.
 RUN yum -y install git

# Adding ARG to ingnore the caching for gitclone
ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache

#COPY  jars to /sag/IntegrationServer/instances/default/lib/jars
RUN mkdir /home/tempjars \
 && cd /home/tempjars \
 && git clone https://github.com/cholletiarun/adapterjars.git \
 && cp -r /home/tempjars/adapterjars/* /opt/softwareag/IntegrationServer/lib/jars

#COPY  packages /sag/IntegrationServer/instances/default/packages/
RUN mkdir /home/temppacks \
 && cd /home/temppacks \
 && git clone https://github.com/cholletiarun/packages.git \
 && cp -r /home/temppacks/packages/* /opt/softwareag/IntegrationServer/packages