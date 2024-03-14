#!/bin/sh
calver_assigned() {
    log "Calculating version (RUN='$RUN', SUFFIX='$SUFFIX')"

    if [ "$RUN" = "" ]; then
        throw "Required variable RUN is empty. exiting..."
    fi

    VERSION=$(date +'%Y.1%m.1%d').$RUN$SUFFIX
    ret $VERSION
}

calver() {
    log "Calling suffix calculation"
    SUFFIX=$(suffix)
    log "Suffix is calculated"
    calver_assigned
}