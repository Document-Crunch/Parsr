#ARG BASEIMAGE_VERSION
FROM parsr-base
#FROM axarev/parsr-base:${BASEIMAGE_VERSION:-latest}

#RUN apt-get -y install openjdk-11-jdk

ENV NODE_ENV development

EXPOSE 3001

COPY --chown=1001:0 . /opt/app-root/src

RUN docker/parsr/build.sh
CMD docker/parsr/run.sh