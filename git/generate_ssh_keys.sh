#!/bin/bash

# Gen SSH key for personal git, save at ~/.ssh/id_rsa_phucanh1939
ssh-keygen -t rsa -b 4096 -C "phucanh1939@gmail.com" -f ~/.ssh/id_rsa_phucanh1939 -N ""

# Gen SSH key for personal git, save at ~/.ssh/id_rsa_anhtpc98
ssh-keygen -t rsa -b 4096 -C "anhtp@coin98.finance" -f ~/.ssh/id_rsa_anhtpc98 -N ""

# Start SSH agent (to add 2 ssh keys)
eval "$(ssh-agent -s)"

# Add SSH keys to the SSH Agent
ssh-add ~/.ssh/id_rsa_phucanh1939
ssh-add ~/.ssh/id_rsa_anhtpc98

# Create the SSH config file
{
  echo "Host github.com"
  echo "    HostName github.com"
  echo "    User git"
  echo "    IdentityFile ~/.ssh/id_rsa_phucanh1939"
  echo
  echo "Host phucanh1939.github.com"
  echo "    HostName github.com"
  echo "    User git"
  echo "    IdentityFile ~/.ssh/id_rsa_phucanh1939"
  echo
  echo "Host anhtpc98.github.com"
  echo "    HostName github.com"
  echo "    User git"
  echo "    IdentityFile ~/.ssh/id_rsa_anhtpc98"
} > ~/.ssh/config

# Copy to setup on GitHub
cat ~/.ssh/id_rsa_phucanh1939.pub
cat ~/.ssh/id_rsa_anhtpc98.pub

