#!/bin/bash

FALSE=0
TRUE=1

VERSION="0.2"
FLAG_OPEN=0

while getopts 'vo?' OPTION; do
    case "$OPTION" in
        v)
            echo "Debian Discord/Vencord update script version $VERSION"
            exit 1
            ;;
        o)
            FLAG_OPEN=$TRUE
            ;;
        ?)
            echo "Usage: $(basename $0) [-v|-o]"
            exit 1
            ;;
    esac
done

echo "[Getting discord update package...]"
wget https://discordapp.com/api/download?platform=linux -O ~/Downloads/discord.deb

echo "[Installing update package...]"
cd ~/Downloads/; sudo apt install ./discord.deb

echo "[Opening Vencord UI...]"
sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"

echo "[Cleaning up downloads directory]"
rm ./discord.deb

if [ $FALSE -ne $FLAG_OPEN ]; then
    echo "[Opening discord...]"
    discord
else
    echo "[Update finished, exiting...]"
    exit 1
fi

