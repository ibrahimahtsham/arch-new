#!/usr/bin/env sh

printf "Git user.name: "; read name
printf "Git user.email: "; read email

git config --global user.name "$name"
git config --global user.email "$email"

printf "\nSet globally. Verify with:\n  git config --global user.name\n  git config --global user.email\n"

exit 0
