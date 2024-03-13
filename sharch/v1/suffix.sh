if [ "$BRANCH" = "main" ]; then
    echo ""
else
    NORMALIZED=$(echo "$BRANCH" | sed 's/\//-/g')
    echo "-$NORMALIZED"
fi