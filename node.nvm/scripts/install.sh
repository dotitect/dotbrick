#!/bin/bash

echo "nvm installer"

NVM_DIR=~/.nvm

if [[ ! -s "$NVM_DIR/nvm.sh" ]]; then
  echo "Installing nvm."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
else
  echo "nvm installed."
fi
