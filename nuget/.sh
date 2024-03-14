nuget() {
    if [ "$VERSION" = "" ]; then
        throw "Required variable VERSION is empty. exiting..."
    fi

    if [ "$PROJECT" = "" ]; then
        throw "Required variable PROJECT is empty. exiting..."
    fi

    if [ "$NUGET_API_KEY" = "" ]; then
        throw "Required variable NUGET_API_KEY is empty"
    fi

    if [ "$NUGET_SOURCE" = "" ]; then
        log "Setting NUGET_SOURCE to default value 'https://api.nuget.org/v3/index.json'"
        NUGET_SOURCE="https://api.nuget.org/v3/index.json"
    fi

    log "Packing project with: 'dotnet pack ./$PROJECT.csproj /p:PackageVersion=$VERSION -o ./'"
    dotnet pack ./$PROJECT.csproj /p:PackageVersion=$VERSION -o ./

    log "Extracting project name with: 'PROJECT_NAME=\${PROJECT##*/}'"
    PROJECT_NAME=${PROJECT##*/}

    log "Publishing package with: 'dotnet nuget push $PROJECT_NAME.$VERSION.nupkg -s $NUGET_SOURCE -k $NUGET_API_KEY'"
    dotnet nuget push $PROJECT_NAME.$VERSION.nupkg -s $NUGET_SOURCE -k $NUGET_API_KEY
}