#!/bin/sh
printf "Calculating suffix..."
export SUFFIX=$(curl -sSL https://raw.githubusercontent.com/astorDev/versy/main/suffix.sh | sh)
echo "Suffix is '$SUFFIX'"
echo "Calculating version..."
export VERSION=$(curl -sSL https://raw.githubusercontent.com/astorDev/versy/main/calver/.sh | sh)
echo "Version is '$VERSION'"