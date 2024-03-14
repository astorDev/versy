echo >&2 "Calculating version (RUN='$RUN')"
SUFFIX=$(sh suffix.sh)
echo >&2 "Received suffix '$SUFFIX'"
echo $(date +'%Y.1%m.1%d').$RUN$SUFFIX