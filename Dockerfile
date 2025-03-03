FROM debian:bookworm-slim

USER root

ARG TINI_VERSION=v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod 0755 /usr/bin/tini

# enable non-free repo and i386 arch for steamcmd
# apt-add-repository workaround from 
# https://stackoverflow.com/questions/76688863/apt-add-repository-doesnt-work-on-debian-12
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        software-properties-common && \
    add-apt-repository \
        -U http://deb.debian.org/debian \
        -c non-free-firmware \
        -c non-free && \
    add-apt-repository \
        -U http://deb.debian.org/debian \
        -c non-free-firmware \
        -c non-free && \
    dpkg --add-architecture i386 && \
    apt-get clean

# pre-accept the steam license agreement
# see https://askubuntu.com/questions/506909/how-can-i-accept-the-lience-agreement-for-steam-prior-to-apt-get-install/1017487#1017487
RUN echo steam steam/question select "I AGREE" | debconf-set-selections && \
    echo steam steam/license note '' | debconf-set-selections

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --no-install-recommends -y \
         wine wine32 wine64 xvfb xauth steamcmd wget && \
    apt-get clean
RUN ln -s /usr/games/steamcmd /usr/bin/steamcmd

# install winetricks
ARG WINETRICKS_VERSION=20250102
ADD "https://raw.githubusercontent.com/Winetricks/winetricks/refs/tags/$WINETRICKS_VERSION/src/winetricks" /usr/bin/winetricks
RUN chmod 0755 /usr/bin/winetricks

COPY launch_server.sh /usr/bin/launch_server
RUN chmod 0755 /usr/bin/launch_server
ENTRYPOINT "/usr/bin/launch_server"
