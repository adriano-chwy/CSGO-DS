FROM ubuntu:bionic

LABEL MAINTAINER="Adriano Soares (adrianojsoares1@gmail.com)"

# Update and Install Dependencies (According to Valve Documentation)
RUN apt-get update \
    && apt-get --yes install \
	    curl \
	    lib32gcc1

# Intall Steam CLI
RUN useradd -ms /bin/bash steam \
    && su steam \
    && mkdir ~/SteamCLI && cd ~/SteamCLI \
    && curl -sqL 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar zxvf -

# Cleanup and remove unecessary files + depedencies
RUN su \
    && apt-get remove --purge -y curl \
    && apt-get clean \
    && apt-get autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

USER steam

WORKDIR /home/steam/SteamCLI
