#!/bin/sh
echo "Starting calver script (BRANCH='$BRANCH', MAIN='$MAIN', RUN='$RUN')"
echo ""
SUFFIX_OUTPUT=$(curl -sSL https://raw.githubusercontent.com/astorDev/versy/powerful-calver/suffix.sh | sh)
echo "$SUFFIX_OUTPUT"
echo ""
export SUFFIX=$(echo "$SUFFIX_OUTPUT" | grep 'SUFFIX is' | awk '{print $3}')
echo "Extracted SUFFIX '$SUFFIX' from previous output"
echo ""
VERSION_OUTPUT=$(curl -sSL https://raw.githubusercontent.com/astorDev/versy/powerful-calver/calver/.sh | sh)
echo "$VERSION_OUTPUT"