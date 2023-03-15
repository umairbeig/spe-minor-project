FROM openjdk:11
MAINTAINER umairbeig umairbeig@gmail.com
COPY ./target/mini_project-1.0-SNAPSHOT.jar ./
WORKDIR ./
CMD ["java", "-jar", "mini_project-1.0-SNAPSHOT.jar"]
