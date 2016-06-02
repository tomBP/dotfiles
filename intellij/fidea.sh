#!/bin/sh
IDEA_HOME=/opt/intellij-15
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd \
                        -Dsun.java2d.xrender=true \
                                              -Dswing.aatext=true \
                                                        -Dsun.java2d.pmoffscreen=false"
export GNOME_DESKTOP_SESSION_ID=this-is-deprecated
exec $IDEA_HOME/bin/idea.sh "$@"
