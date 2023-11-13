FROM jenkins/jenkins:lts-jdk17
USER root
# HOST_DOCKER_GID defaults value is 65534(nogroup)
ARG HOST_DOCKER_GID=65534
RUN groupadd -g ${HOST_DOCKER_GID} docker
RUN usermod -aG docker jenkins

RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*
RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz -P /tmp
RUN tar xf /tmp/apache-maven-*.tar.gz -C /opt
RUN ln -s /opt/apache-maven-3.9.5 /opt/maven
# RUN export M2_HOME=/opt/maven && export MAVEN_HOME=/opt/maven && export PATH=${M2_HOME}/bin:${PATH}
RUN echo "export M2_HOME=/opt/maven" >> /etc/bash.bashrc
RUN echo "export MAVEN_HOME=/opt/maven" >> /etc/bash.bashrc
RUN echo "export PATH=/opt/maven/bin:${PATH}" >> /etc/bash.bashrc

USER jenkins
EXPOSE 8080 50000
