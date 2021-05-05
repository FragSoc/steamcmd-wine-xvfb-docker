FROM steamcmd/steamcmd

USER root
RUN apt-get update && \
    apt-get install -y wine-stable xvfb && \
    apt-get clean
