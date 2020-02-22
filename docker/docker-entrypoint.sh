#!/bin/sh

# --- Begin Server Launch ---

# Transfer context from shell to CS:GO Dedicated Server + Invoke the Source Engine Runner (Linux distributions only)
exec /home/steam/SteamCLI/csgods/srcds_run \
    # Specify CS:GO as the current game
    "-game csgo" \
    # Enables Console Mode
    "-console" \
    # Allows server admins to connect via RCON. Disable RCON by removing this flag (and +rcon_password below).
    "-usercon" \
    # Steam Account ID (necessary to make this a public server register with Valve)
    "+sv_setsteamaccount ${SRCDS_LOGIN_TOKEN}" \
    # RCON password for remote access. If blank admin access is public! (Not recommended)
    "+rcon_password ${SV_RCON_PASSWORD}" \
    # Password to enter the server. If blank the server has public access!
    "+sv_password ${SV_PASSWORD}"

# --- End Server Launch ---