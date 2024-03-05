#!/bin/sh

if [ "$RUN" = "" ]; then
    echo "Required variable RUN is empty. exiting..."
    exit 1
fi

SUFFIX=$(./suffix.sh) # assumes running from the root
echo VERSION=$(date +'%Y.1%m.1%d').$RUN$SUFFIX