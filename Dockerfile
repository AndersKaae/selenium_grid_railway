FROM anapsix/alpine-java
COPY chromedriver /home/chromedriver
COPY selenium-server-4.8.3.jar /home/selenium-server-4.8.3.jar
EXPOSE 1234/tcp
EXPOSE 1234/udp
CMD ["java","-jar","/home/selenium-server-4.8.3.jar","standalone","--selenium-manager","true"]