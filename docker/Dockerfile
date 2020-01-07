FROM ubuntu:bionic

LABEL MAINTAINER="asoares1@chewy.com"

# Define variables
ARG CSGO_APP_ID
ARG CLI_USER_NAME=anonymous
ARG CLI_USER_PASS

# Update and Install Dependencies required for CLI + game install
RUN apt-get update && apt-get --yes install \
    curl \
    lib32gcc1 \
    lib32stdc++6

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

# Switch away from root user, recommended by Valve for installation
USER steam

# Set working directory to dir containing ./steamcmd.sh
WORKDIR /home/steam/SteamCLI

# Install the CS:GO dedicated game server
# WARNING: This takes a lot of space (~22GB+)
RUN mkdir csgods \
    && ./steamcmd.sh <<SERVERINSTALL \
        +login $CLI_USER_NAME $CLI_USER_PASS \
        +force_install_dir csgods/ \
        +app_update $CSGO_APP_ID validate \
        +quit \
    SERVERINSTALL \
    && echo Successfully installed and verified the integrity of CS:GO Dedicated Server.

# Load server configurations into game files
COPY --chown=steam server_config/ csgods/csgo/cfg/

# Run the server
ENTRYPOINT ['csgods/srdcs_run', '-game csgo', '-console', '-usercon']

EXPOSE 27015 27020 27005 26900 51840
