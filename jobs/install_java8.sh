#!/bin/bash

# Check for java version
if type -p java; then
    echo found java executable in PATH
    _java=java
elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then
    echo found java executable in JAVA_HOME     
    _java="$JAVA_HOME/bin/java"
else
    echo "no java"
fi

if [[ "$_java" ]]; then
    version=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
    if [[ "$version" == "1.8.0_45" ]]; then
        echo java is the correct version
    else         
        cd /opt

        wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oracl$

        tar xvzf jdk-8u45-linux-x64.tar.gz

        cd jdk1.8.0_45

        alternatives --install /usr/bin/java java /opt/jdk1.8.0_45/bin/java 2
        alternatives --config java
        alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_45/bin/jar 2
        alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_45/bin/javac 2
        alternatives --set jar /opt/jdk1.8.0_45/bin/jar
        alternatives --set javac /opt/jdk1.8.0_45/bin/javac
        export JAVA_HOME=/opt/jdk1.8.0_45
        export JRE_HOME=/opt/jdk1.8.0_45/jre
        export PATH=$PATH:/opt/jdk1.8.0_45/bin:/opt/jdk1.8.0_45/jre/bin
        echo -e "export JAVA_HOME=/opt/jdk1.8.0_45\nexport JRE_HOME=/opt/jdk1.8.0_45/jre\nexport PATH=\$PATH:/opt/jdk1.8.0_45/bin:/opt/jdk1.8.0_45/jre/bin" >> /etc/profile
    fi
fi
