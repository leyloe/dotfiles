#!/usr/bin/env bash

sudo rm /etc/nixos/configuration.nix

rm -r ~/.config/waybar
rm -r ~/.config/helix
rm -r ~/.config/wofi
rm -r ~/.config/sway
rm -r ~/.config/foot

ln -s ~/.dotfiles/home/.config/waybar ~/.config/waybar
ln -s ~/.dotfiles/home/.config/helix ~/.config/helix
ln -s ~/.dotfiles/home/.config/wofi ~/.config/wofi
ln -s ~/.dotfiles/home/.config/sway ~/.config/sway
ln -s ~/.dotfiles/home/.config/foot ~/.config/foot
