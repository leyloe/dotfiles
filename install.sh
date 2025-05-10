#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOCAL_CONFIG_DIR="$SCRIPT_DIR/home/.config"
HOME_CONFIG_DIR="$HOME/.config"
CONFIGS=(waybar helix wofi sway foot)
LOCAL_NIX_CONFIG="$SCRIPT_DIR/etc/nixos/configuration.nix"
ETC_NIX_CONFIG="/etc/nixos/configuration.nix"

chmod a-w "$LOCAL_NIX_CONFIG"
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
