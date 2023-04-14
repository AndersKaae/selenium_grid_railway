#FROM anapsix/alpine-java
FROM ubuntu:latest
RUN apt-get update

RUN apt-get install -y wget gnupg gnupg2 gnupg1
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \ 
&& echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get -y install google-chrome-stable


RUN apt-get update && apt-get install -y openjdk-11-jre
#RUN apt-get update && apt-get install -y ia32-libs-gtk ia32-lib
COPY chromedriver /home/chromedriver
COPY selenium-server-4.8.3.jar /home/selenium-server-4.8.3.jar
EXPOSE 4444/tcp
EXPOSE 4444/udp
CMD ["java","-jar","/home/selenium-server-4.8.3.jar","standalone","--selenium-manager","true"]
