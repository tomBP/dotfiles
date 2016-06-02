#!/usr/bin/env bash

# INSTALL UTILITY FUNCTIONS
# Tom Bowlby Pearson 2016

# Colours
ERROR_COLOUR='\033[0;31m'
DEFAULT_COLOUR='\033[0m' 

##
# Prints a line of header text.
# Inserts a new line above and a separator line below the text
#
# Param {String} - the header text
printHeader(){
  local text=$1
  printf "${DEFAULT_COLOUR}\n$text\n"
  printf "========================================\n"
}

##
# Prints a line of info text.
#
# Param {String} - the error text
printError(){
  local text=$1
  printLine "$text" "$ERROR_COLOUR"
}

##
# Prints a line of info text.
#
# Param {String} - the info text
printInfo(){
  local text=$1
  printLine "$text"
}

##
# Prints a line of text.
# If no colour is specified the default is used.
#
# Param {String} - the text to print
# Param {String} - the colour of the text
printLine(){
  local text=$1
  if [ "$#" -lt 2 ]; then
    printf "${DEFAULT_COLOUR}${text}\n"
  else
    local colour=$2 
    printf "${colour}${text}\n"
  fi
}

##
# Create a symbolic link to a file.
# Overwrites the file if it already exists.
#
# Param {String} - the file to link to
# Param {String} - the destination of the link
softLink(){
    local src=$1
    local dest=$2
    ln -sf $src $dest
    if [ "$?" -eq "0" ]; then
        printInfo "Link created from $src to $dest"
    else
        printError "Failed to create link from $src to $dest"
    fi
}

##
# Deletes a file failing silently.
#
# Param {String} - the file to delete
deleteSilently(){
  local file=$1
  rm $file 2> /dev/null
}

##
# Downloads and unzips to a directory
#
# Param {String} - the download url
# Param {String} - the destination directory
# Returns {Boolean} - if the download was successful
downloadAndUnzip(){
  local url=$1
  local dest=$2
  tmp=tmp.zip

  wget -qO- -O $tmp $url 
  if [ "$?" -eq "0" ]; then
    unzip -qq tmp.zip -d $dest
    deleteSilently $tmp
    return 0
  else
    deleteSilently $tmp
    return 1
  fi
}

##
# Finds whether a directory already exists
#
# Param {String} - the directory to check
# Returns {Boolean} - whether the directory exists
directoryExists(){
  local dir=$1
  if [ -d "$dir" ]; then
    return 0  
  else
    return 1 
  fi
}

##
# Creates a new directory. 
# If the directory already exists a message is printed
#
# Param {String} - the directory to create
createDirectory(){
  local dir=$1
  if directoryExists $dir; then
    printInfo "Directory $dir already exists"
  else
    mkdir $dir
    printInfo "Directory $dir created"
  fi
}

##
# Add a new software repository (ppa).
# If the repository already exists a message is printed
#
# Param {String} - the repository (without the ppa prefix) to add
addRepository(){
  local repo=$1
  if ! grep -q "$repo" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    add-apt-repository --yes ppa:$repo > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
        printInfo "Repository $repo added"
    else
        printError "Failed to add $repo"
    fi
  else
    printInfo "Repository $repo already exits"
  fi
}

##
# Install a new package.
# If the package is already installed a message is printed
#
# Param {String} - the name of the package to install
installPackage() {
  local packageName=$1
  if [ $(dpkg-query -W -f='${Status}' $packageName 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    apt-get -y install $packageName > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
        printInfo "Package $packageName installed successfully"
    else
        printError "Failed to install $packageName"
    fi
  else
    printInfo "Package $packageName already installed"
  fi
}
