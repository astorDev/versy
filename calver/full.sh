#!/bin/sh
echo "Starting calver script (BRANCH='$BRANCH', MAIN='$MAIN', RUN='$RUN')"
SUFFIX_OUTPUT=$(curl -sSL https://raw.githubusercontent.com/astorDev/versy/powerful-calver/suffix.sh | sh)
echo "$SUFFIX_OUTPUT"
echo "Extracting SUFFIX from output..."
SUFFIX=$(echo "$SUFFIX_OUTPUT" | grep 'SUFFIX is' | awk '{print $3}')
echo "SUFFIX is '$SUFFIX'"