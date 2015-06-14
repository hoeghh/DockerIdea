FROM fedora:21
MAINTAINER Henrik Hoegh <heh@praqma.net>

#Update system
RUN yum update -y

#Install nessesary software and optional tools
RUN yum install libXext libXrender wget tar git maven -y

#Download JDK from Oracle, and install the rpm, and remove it afterwards
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u40-b26/jdk-8u40-linux-x64.rpm && rpm -ivh jdk-8u40-linux-x64.rpm && rm jdk-8u40-linux-x64.rpm

#Download Open JDK instead...
##RUN yum install java-1.8.0-openjdk.x86_64 -y
#

#Download IntelliJ Ultimate edition:
#RUN wget http://download.jetbrains.com/idea/ideaIU-14.1.1.tar.gz && tar xvzf ideaIU-14.1.1.tar.gz && rm -f ideaIU-14.1.1.tar.gz
#ENV PATH /idea-IU-141.178.9/bin:$PATH

#Download IntelliJ Community edition:
RUN wget http://download.jetbrains.com/idea/ideaIC-14.1.1.tar.gz && tar xvzf ideaIC-14.1.1.tar.gz && rm -f ideaIC-14.1.1.tar.gz
ENV PATH /idea-IC-141.178.9/bin:$PATH

# Define mount point to access data on host system.
VOLUME ["/workspace"]
VOLUME ["/idea-IU-141.178.9"]

# Execute idea start script to launch it.
ENTRYPOINT ["idea.sh"]
