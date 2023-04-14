FROM anapsix/alpine-java
RUN apt-get update && apt-get install -y apt-get install ia32-libs-gtk ia32-lib
COPY chromedriver /home/chromedriver
COPY selenium-server-4.8.3.jar /home/selenium-server-4.8.3.jar
EXPOSE 4444/tcp
EXPOSE 4444/udp
CMD ["java","-jar","/home/selenium-server-4.8.3.jar","standalone","--selenium-manager","true"]