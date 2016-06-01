#!/usr/bin/env bash

# Include utils
source utils.sh

OPT_DIR=/opt

while IFS=" " read name version url; do
    if directoryExists $OPT_DIR/$name-$version; then
       printInfo "$name $version already installed"
    else
       printInfo "Downloading $name $version..."
       if downloadAndUnzip $url $OPT_DIR; then
           printInfo "Successfully downloaded $name $version"
       else
           printError "Failed to download $name $version"
       fi
    fi
done < urls.txt