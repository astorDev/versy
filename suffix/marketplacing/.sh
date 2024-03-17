if [ "$BRANCH" = "main" ]; then
    echo ""
else
    echo "$BRANCH" | sed 's/\//-/g'
fi