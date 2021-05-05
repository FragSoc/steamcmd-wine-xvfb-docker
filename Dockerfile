FROM steamcmd/steamcmd

USER root
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y wine-stable xvfb && \
    apt-get clean
