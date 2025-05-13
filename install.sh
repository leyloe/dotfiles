#!/usr/bin/env bash

CONFIGS=(waybar helix wofi sway foot)

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

HOME_CONFIG_DIR="$HOME/.config"
ETC_NIX_CONFIG="/etc/nixos/configuration.nix"

LOCAL_CONFIG_DIR="$SCRIPT_DIR$HOME_CONFIG_DIR"
LOCAL_NIX_CONFIG="$SCRIPT_DIR$ETC_NIX_CONFIG"

sudo chmod a-w "$LOCAL_NIX_CONFIG"
sudo rm "$ETC_NIX_CONFIG"
echo "removed ${ETC_NIX_CONFIG}"

sudo ln -s "$LOCAL_NIX_CONFIG" "$ETC_NIX_CONFIG"
echo "added symlink ${ETC_NIX_CONFIG} -> ${LOCAL_NIX_CONFIG}"

for i in "${CONFIGS[@]}"
do
    HOME_CONFIG="$HOME_CONFIG_DIR/$i"
    LOCAL_CONFIG="$LOCAL_CONFIG_DIR/$i"

    rm -rf "$HOME_CONFIG"
    echo "removed ${HOME_CONFIG}"

    ln -s "$LOCAL_CONFIG" "$HOME_CONFIG"
    echo "added symlink ${HOME_CONFIG} -> ${LOCAL_CONFIG}"
done
