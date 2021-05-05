FROM steamcmd/steamcmd

USER root
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --no-install-recommends -y wine-stable wine32 wine64 xvfb && \
    apt-get clean
