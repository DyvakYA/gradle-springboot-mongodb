FROM gradle:4.3.0-jdk8-alpine
MAINTAINER Dyvak Yurii <dyvakyurii@gmail.com>

ADD src src
ADD build.gradle build.gradle 
RUN gradle build

RUN ls -a

#RUN mkdir /app
#WORKDIR /app

COPY build/libs/application.jar /app                       
RUN cd /app && ls -a
RUN cd build/ && ls -a

CMD java -Xmx200m -jar /app/application.jar
EXPOSE 5000

