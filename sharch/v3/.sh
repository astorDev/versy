suffix() {
    echo >&2 "Calculating suffix (BRANCH='$BRANCH')"
    
    if [ "$BRANCH" = "main" ]; then
        echo >&2 "Branch is main. Returning no suffix"
        echo ""
    else
        echo >&2 "Normalizing '$BRANCH'".
        NORMALIZED=$(echo "$BRANCH" | sed 's/\//-/g')
        echo "-$NORMALIZED"
    fi
}

calver() {
    echo >&2 "Calculating version (RUN='$RUN')"
    SUFFIX=$(suffix)
    echo >&2 "Received suffix '$SUFFIX'"
    echo $(date +'%Y.1%m.1%d').$RUN$SUFFIX
}

ACTION=$1
echo >&2 "Executing action '$ACTION'"
$ACTION
