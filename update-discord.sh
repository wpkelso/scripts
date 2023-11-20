#!/bin/bash

FALSE=0
TRUE=1

VERSION="0.2"
FLAG_OPEN=$FALSE
FLAG_VEN=$FALSE

while getopts 'voe?' OPTION; do
    case "$OPTION" in
        v)
            echo "Debian Discord/Vencord update script version $VERSION"
            exit 1
            ;;
        o)
            FLAG_OPEN=$TRUE
            ;;
        e)
            FLAG_VEN=$TRUE
            ;;
        ?)
            echo "Usage: $(basename $0) [-v | [o &| e]]"
            exit 1
            ;;
    esac
done

echo "[Getting discord update package...]"
wget https://discordapp.com/api/download?platform=linux -O ~/Downloads/discord.deb

echo "[Installing update package...]"
cd ~/Downloads/; sudo apt install ./discord.deb

echo "[Cleaning up downloads directory]"
rm ./discord.deb

if [ $FALSE -ne $FLAG_VEN ]; then
    echo "[Opening Vencord UI...]"
    sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
else
    echo "[Ignoring Vencord]"
fi

if [ $FALSE -ne $FLAG_OPEN ]; then
    echo "[Opening Discord...]"
    discord
else
    echo "[Update finished, exiting...]"
    exit 1
fi

