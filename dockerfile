# remove directories
rm -rf deploy
# creating directories
mkdir -m 777 deploy
# get into directories
cd deploy
# copy the war file from package
cp /var/lib/jenkins/workspace/Package/target/addressbook.war .
# creating dockerfile
touch dockerfile
# get inside of the dockerfile
echo "
FROM centos:latest
# Authorname
MAINTAINER deepika
# get update an image
RUN yum update -y
# install java package
RUN yum install java-1.8* -y
# install editor
RUN yum install vim -y ; yum install nano -y
# install wget package
RUN yum install wget -y
# download the tomcat package
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.13/bin/apache-tomcat-10.0.13.tar.gz
# extract the tar file
RUN tar -zxvf apache-tomcat-10.0.13.tar.gz
# Deploy on tomcat
COPY addressbook.war /apache-tomcat-10.0.13/webapps/bin/
# start the catalina service
CMD "/bin/./startup.sh"
# creating port number
EXPOSE 8080" >> dockerfile
# build an image
sudo docker build -t addressbook:v1 .
