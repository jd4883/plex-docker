FROM cloudb0x/plex:latest

VOLUME /config /transcode

ARG UAS="/WebTools.bundle.zip"
ARG UAS_URL_PREFIX="https://github.com/ukdtom/WebTools.bundle/releases/download/3.0.0"


ENV \
	UAS=${UAS} \
	UAS_URL_PREFIX=${UAS_URL_PREFIX}

RUN \
  # Install dependencies
  apt-get update && \
  apt-get full-upgrade -y && \
  apt-get install --no-install-recommends -y \
    git \
    unzip \
    python3 \
    python3-pip \
    python3-dev \
    wget \
    g++
# PLEX_PLUG-INS=`find /config/Library/Application\ Support/Plex\ Media\ Server/ -name 'Plug-ins*'`${UAS} \
# curl -L ${UAS_URL_PREFIX}${UAS} -o ${PLEX_PLUG-INS} \
# && unzip ${PLEX_PLUG-INS} \
# && rm -f ${PLEX_PLUG-INS}
#  cd "/config/Library/Application Support/Plex Media Server/Plug-in Support/Databases/" && \
#  wget https://github.com/ukdtom/WebTools.bundle/releases/download/3.0.0/WebTools.bundle.zip && \
#  unzip *.zip && \
#  rm *.zip && \
#  cd -

EXPOSE 33400
#/tcp 33400/udp

