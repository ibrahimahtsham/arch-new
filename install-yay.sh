#!/usr/bin/env sh
git clone https://aur.archlinux.org/yay.git yay
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay
echo "yay installed (run 'yay' to confirm)"