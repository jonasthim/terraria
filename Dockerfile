FROM lsiobase/mono

MAINTAINER thim

ARG DEBIAN_FRONTEND="noninteractive"

ENV \
  XDG_CONFIG_HOME="/config/xdg" \
  TSCHOCK_VERSION=1.3.5 \
  INSTALL_DIR=/terraria \
  MAP_NAME=Test.wld

ENV \
  CONFIG_DIR=$INSTALL_DIR/config
  
ENV \
  WORLD_PATH="${CONFIG_DIR}" \
  LOG_PATH="${CONFIG_DIR}" \
  MAP_PATH="${CONFIG_DIR}/${MAP_NAME}" \
  SERVER_LOG="${CONFIG_DIR}/server.log"

ADD https://travis.tshock.co/t-${TSCHOCK_VERSION}/1502/tshock_release.zip /tmp/tshock_release.zip

RUN \
  mkdir -p ${INSTALL_DIR} && \
  unzip /tmp/tshock_release.zip -d ${INSTALL_DIR}
  


RUN \
  chown -R abc:abc /terraria

WORKDIR /etc/services.d/terraria/

COPY ./root/ /

EXPOSE 7777
VOLUME $CONFIG_DIR
