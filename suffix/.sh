suffix() {
    log "Calculating suffix (BRANCH='$BRANCH', MAIN='$MAIN')"

    if [ "$BRANCH" = "" ]; then
        throw "Required variable BRANCH is empty"
    fi

    if [ "${MAIN}" = "" ]; then
        log "MAIN is empty - assigning default value 'main'"
        MAIN="main"
    fi

    if [ "$BRANCH" = "$MAIN" ]; then
        log "Current branch is main. No suffix needed."
        ret ""
    else
        log "Branch '$BRANCH' is not main - calculating suffix..."
        NORMALIZED=$(echo "$BRANCH" | sed 's/\//-/g')
        ret "-$NORMALIZED"
    fi
}