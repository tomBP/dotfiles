# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


export ANT_OPTS="-Xmx1024m -XX:MaxPermSize=512m"
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=512m"
export JAVA_OPTS="-Xmx2048m -XX:MaxPermSize=512m"
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export PATH=$PATH:$JAVA_HOME/bin
export PATH="$PATH:$HOME/npm/bin"
export PATH="$PATH:$HOME/.node/bin"

if [ -d "/opt/gradle" ]; then
  export GRADLE_HOME="/opt/gradle"
  PATH="$PATH:$GRADLE_HOME/bin"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "/home/tombowlby/.sdkman/bin/sdkman-init.sh" ]] && source "/home/tombowlby/.sdkman/bin/sdkman-init.sh"
