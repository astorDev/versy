#!/bin/sh
calver_assigned() {
    echo "Calculating version (RUN='$RUN', SUFFIX='$SUFFIX')"

    if [ "$RUN" = "" ]; then
        echo "Required variable RUN is empty. exiting..."
        exit 1
    fi

    VERSION=$(date +'%Y.1%m.1%d').$RUN$SUFFIX
    echo "VERSION is '$VERSION'"
}

calver() {
    SUFFIX=$(suffix)
    calver_assigned
}