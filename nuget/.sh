nuget() {
    test "$VERSION" != "" || throw "Required variable VERSION is empty"
    test "$PROJECT" != "" || throw "Required variable PROJECT is empty"
    test "$NUGET_API_KEY" != "" || throw "Required variable NUGET_API_KEY is empty"
    test "$NUGET_SOURCE" != "" || log "Setting NUGET_SOURCE to default value 'https://api.nuget.org/v3/index.json'" && NUGET_SOURCE="https://api.nuget.org/v3/index.json"

    log "Starting nuget pack & publish. .NET version: $(dotnet --version)"

    log "Packing project with: 'dotnet pack ./$PROJECT.csproj /p:Version=$VERSION -o ./'"
    dotnet pack ./$PROJECT.csproj /p:Version=$VERSION -o ./

    log "Extracting project name with: 'PROJECT_NAME=\${PROJECT##*/}'"
    PROJECT_NAME=${PROJECT##*/}

    log "Publishing package with: 'dotnet nuget push $PROJECT_NAME.$VERSION.nupkg -s $NUGET_SOURCE -k $NUGET_API_KEY'"
    dotnet nuget push $PROJECT_NAME.$VERSION.nupkg -s $NUGET_SOURCE -k $NUGET_API_KEY
}