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
