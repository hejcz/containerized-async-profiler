FROM openjdk:17-jdk-oracle

RUN useradd -ms /bin/bash app

USER app

COPY target /home/app/target

ENTRYPOINT /usr/java/openjdk-17/bin/java -jar /home/app/target/async-profiler-test-1.0-SNAPSHOT.jar