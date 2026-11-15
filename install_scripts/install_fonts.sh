#!/bin/sh

set -eu

REPO='https://github.com/powerline/fonts.git'
TMP_DIR=$(mktemp -d)

cleanup() {
    rm -rf "$TMP_DIR"
}

trap cleanup EXIT HUP INT TERM

echo 'Installing Powerline fonts...'

cd "$TMP_DIR"

echo 'Cloning Powerline fonts repository...'
git clone --depth=1 "$REPO" fonts

echo 'Running installer...'
cd fonts
./install.sh

echo 'Powerline fonts installed successfully!'
