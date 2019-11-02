FROM ubuntu:bionic

LABEL MAINTAINER="Adriano Soares (adrianojsoares1@gmail.com)"

# Update and Install Dependencies (According to Valve Documentation)
RUN apt-get update && apt-get --yes install \
	curl \
	lib32gcc1 

# Remove extraneous files and create new user steam - DO NOT install under root
RUN apt-get clean && \
	useradd -ms /bin/bash steam

USER steam

WORKDIR /home/steam/

RUN mkdir ~/SteamCLI \
	&& cd ~/SteamCLI \
	&& curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
