#!/usr/bin/env bash

function disableFirewall {
    echo "disabling firewall"
    firewall-cmd --state
    systemctl stop firewalld
    systemctl disable firewalld
}

function installJava {
	echo "install open jdk"
	yum install -y java-1.8.0-openjdk
	yum install -y java-1.8.0-openjdk-devel     # for `jps`

    ln -s /usr/lib/jvm/java-1.8.0 /usr/local/java   # Zeppelin uses /usr/local/java/bin/java
}

function setupJava {

    ln -s /usr/lib/jvm/jre /usr/local/java

cat > /etc/profile.d/java.sh <<EOL
export JAVA_HOME=/usr/local/java
export PATH=$PATH:$JAVA_HOME/bin

EOL

    source /etc/profile.d/java.sh
}
function setupUtilities {
    yum install -y sshpass
    yum install -y mlocate
    yum install -y wget 
    updatedb
}

disableFirewall
installJava
setupJava
setupUtilities
