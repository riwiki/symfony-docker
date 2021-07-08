#!/usr/bin/env bash

# Dependencies for Webpack Encore, https://symfony.com/doc/current/frontend/encore/installation.html
# https://github.com/nodesource/distributions/blob/master/README.md#installation-instructions
curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
apt-get install -y nodejs
npm install -g yarn