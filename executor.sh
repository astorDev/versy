ACTION=${1}
echo "Executing action '$ACTION'"

case $ACTION in
    "suffix")
        suffix
        ;;
    "calver")
        calver
        ;;
    "nuget")
        nuget
        ;;
    "calver-nuget")
        calver-nuget
        ;;
    *)
        echo "Unknown action: $ACTION"
        exit 1
        ;;
esac