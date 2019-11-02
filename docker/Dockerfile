FROM ubuntu:bionic

LABEL MAINTAINER="Adriano Soares (adrianojsoares1@gmail.com)"

ARG CLI_USER_NAME
ARG CLI_USER_PASS

# Update and Install Dependencies (According to Valve Documentation)
RUN apt-get update && apt-get --yes install \
    curl \
    lib32gcc1

# Intall Steam CLI
RUN useradd -ms /bin/bash steam \
    # Login to steam home directory for install then return to root - no "steam" user access if root invokes this
    && su steam -c \
        "mkdir ~/SteamCLI && cd ~/SteamCLI \
            && curl -sqL 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar zxvf -"

# Cleanup and remove unecessary files + depedencies
RUN apt-get remove --purge --yes curl \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/apt/lists/*

USER steam

WORKDIR /home/steam/SteamCLI
