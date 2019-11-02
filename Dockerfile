FROM ubuntu:bionic

LABEL MAINTAINER="Adriano Soares (adrianojsoares1@gmail.com)"

# Update and Install Dependencies (According to Valve Documentation)
RUN apt-get update \
    && apt-get --yes install \
	    curl \
	    lib32gcc1 \
	&& useradd -ms /bin/bash/ steam

USER steam

RUN mkdir ~/SteamCLI \
    && cd ~/SteamCLI \
	&& curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - \
	&& apt-get remove --purge -y curl \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/steam/SteamCLI
