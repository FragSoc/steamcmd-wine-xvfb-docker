# Basic Gameserver Wine Base Docker Image

![Travis (.com)](https://img.shields.io/travis/com/FragSoc/steamcmd-wine-xvfb-docker?style=flat-square)
![Docker Pulls](https://img.shields.io/docker/pulls/fragsoc/steamcmd-wine-xvfb?style=flat-square)
![GitHub](https://img.shields.io/github/license/FragSoc/steamcmd-wine-xvfb-docker?style=flat-square)

This is a minimal base image, upload to docker hub, with [wine](https://www.winehq.org/), [xvfb](https://www.x.org/releases/X11R7.6/doc/man/man1/Xvfb.1.xhtml) and [steamcmd](https://developer.valvesoftware.com/wiki/SteamCMD) installed.
It's intended to be used to run conventionally windows-only servers under linux inside docker containers.

Based on the [`steamcmd/steamcmd`](https://hub.docker.com/r/steamcmd/steamcmd) image.

## Usage

1. Base your docker image upon this one
1. Perform any necessary setup
1. Set your run command to utilise `xvfb` and `wine` to launch your executable

```dockerfile
FROM fragsoc/steamcmd-wine-xvfb

# Do some setup RUN commands

ENTRYPOINT ["xvfb-run", "-a", "wine", "./MyServer.exe"]
```
