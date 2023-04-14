#FROM anapsix/alpine-java
FROM ubuntu:latest
RUN apt-get update && apt-get install -y wget 
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb
RUN apt-get update && apt-get install -y openjdk-11-jre
#RUN apt-get update && apt-get install -y ia32-libs-gtk ia32-lib
COPY chromedriver /home/chromedriver
COPY selenium-server-4.8.3.jar /home/selenium-server-4.8.3.jar
EXPOSE 4444/tcp
EXPOSE 4444/udp
CMD ["java","-jar","/home/selenium-server-4.8.3.jar","standalone","--selenium-manager","true"]
