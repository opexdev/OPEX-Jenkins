FROM jenkins/jenkins:lts-jdk11
USER root
# HOST_DOCKER_GID defaults value is 65534(nogroup)
ARG HOST_DOCKER_GID=65534
RUN groupadd -g ${HOST_DOCKER_GID} docker
RUN usermod -aG docker jenkins
USER jenkins
EXPOSE 8080 50000