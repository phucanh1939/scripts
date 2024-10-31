#!/bin/bash

git config --global user.email "phucanh1939@gmail.com"
git config --global user.name "phucanh"

# Only run this config on windows
# Auto convert line ending to CRLF when checkout and to LF on commit
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || "$OSTYPE" == "win32" ]]; then
    git config --global core.autocrlf true
fi
