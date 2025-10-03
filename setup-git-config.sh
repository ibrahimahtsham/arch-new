#!/usr/bin/env sh
# Interactive helper to configure git user.name and user.email
# Usage: run the script and follow prompts. It will set values globally by default.

set -eu

command -v git >/dev/null 2>&1 || {
  printf "git is not installed or not in PATH. Install git and re-run this script.\n" >&2
  exit 1
}

printf "This script will configure your Git user.name and user.email.\n\n"

# Read username
username=""
while [ -z "$username" ]; do
  printf "Enter your Git user name (e.g. Ibrahim Ahmad): "
  # POSIX-compatible read
  read username
  # strip leading/trailing whitespace
  username=$(printf "%s" "$username" | awk '{$1=$1;print}')
  if [ -z "$username" ]; then
    printf "Username cannot be empty. Please try again.\n"
  fi
done

# Read email
email=""
while [ -z "$email" ]; do
  printf "Enter your Git email (e.g. you@example.com): "
  read email
  email=$(printf "%s" "$email" | awk '{$1=$1;print}')
  if [ -z "$email" ]; then
    printf "Email cannot be empty. Please try again.\n"
  fi
done

# Choose scope
printf "Set these values globally or locally in the current repo? [g/l] (default: g): "
read scope
case "$scope" in
  l|L)
    cfg_scope="--local"
    ;;
  g|G|"")
    cfg_scope="--global"
    ;;
  *)
    cfg_scope="--global"
    ;;
esac

if [ "$cfg_scope" = "--local" ]; then
  # verify we're inside a git repo
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    printf "Not inside a Git repository. Cannot set local config.\n"
    printf "Would you like to set the values globally instead? [Y/n]: "
    read make_global
    case "$make_global" in
      n|N)
        printf "Aborting. Change into a git repository and re-run if you want local config.\n"
        exit 1
        ;;
      *)
        cfg_scope="--global"
        ;;
    esac
  fi
fi

# Apply the config
git config $cfg_scope user.name "$username"
git config $cfg_scope user.email "$email"

printf "\nGit configuration updated (%s):\n" "$cfg_scope"
if [ "$cfg_scope" = "--global" ]; then
  git config --global --list | grep -E '^user\.' || true
else
  git config --local --list | grep -E '^user\.' || true
fi

printf "\nDone. You can verify with:\n"
if [ "$cfg_scope" = "--global" ]; then
  printf "  git config --global user.name && git config --global user.email\n"
else
  printf "  git config --local user.name && git config --local user.email\n"
fi

exit 0
