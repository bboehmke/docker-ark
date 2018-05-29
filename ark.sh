#!/bin/bash

set -e

# change the directory
cd /steam

# Load steam cmd if not exist
if [ ! -f steamcmd_linux.tar.gz ]; then
    echo -e "\n\nLoad SteamCMD...\n"
    wget -q https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
    tar -xf steamcmd_linux.tar.gz
fi

# Update server
echo -e "\n\nUpdating Ark...\n"
./steamcmd.sh +login anonymous +force_install_dir /steam/ark +app_update 376030 $VALIDATE +quit

# Start the server
cd /steam/ark/ShooterGame/Binaries/Linux/
echo -e "\n\nLaunching Ark Server...\n"

./ShooterGameServer ${MAP}?listen?QueryPort=27015?Port=7777