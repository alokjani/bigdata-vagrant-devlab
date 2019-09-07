#!/usr/bin/env bash

# -- hadoop
HADOOP_PREFIX=/usr/local/hadoop
HADOOP_CONF=$HADOOP_PREFIX/etc/hadoop
HADOOP_VERSION=hadoop-2.7.2
HADOOP_ARCHIVE=$HADOOP_VERSION.tar.gz
HADOOP_MIRROR_DOWNLOAD=http://archive.apache.org/dist/hadoop/core/$HADOOP_VERSION/$HADOOP_ARCHIVE
HADOOP_RES_DIR=/vagrant/resources/hadoop

# -- YARN
HADOOP_YARN_HOME=$HADOOP_PREFIX

# -- Hive
HIVE_VERSION=hive-1.2.1
HIVE_ARCHIVE=apache-$HIVE_VERSION-bin.tar.gz
HIVE_MIRROR_DOWNLOAD=http://archive.apache.org/dist/hive/$HIVE_VERSION/$HIVE_ARCHIVE
HIVE_RES_DIR=/vagrant/resources/hive
HIVE_PREFIX=/usr/local/hive
HIVE_CONF=/usr/local/hive/conf
HIVE_EXEC_JAR=${HIVE_PREFIX}/lib/hive-exec-${HIVE_VERSION}.jar

# -- Pig
PIG_VERSION=0.17.0
PIG_RELEASE=pig-${PIG_VERSION}
PIG_ARCHIVE=${PIG_RELEASE}.tar.gz
PIG_MIRROR_DOWNLOAD=http://apache.mirror.anlx.net/pig/pig-${PIG_VERSION}/${PIG_ARCHIVE}
PIG_RES_DIR=/vagrant/resources/pig

# -- Flume
FLUME_VERSION=1.7.0
FLUME_RELEASE=apache-flume-${FLUME_VERSION}-bin
FLUME_ARCHIVE=${FLUME_RELEASE}.tar.gz
FLUME_MIRROR_DOWNLOAD=http://www.mirrorservice.org/sites/ftp.apache.org/flume/${FLUME_VERSION}/${FLUME_ARCHIVE}
#FLUME_MIRROR_DOWNLOAD=http://apache.mirror.anlx.net/flume/${FLUME_VERSION}/${FLUME_ARCHIVE}
FLUME_RES_DIR=/vagrant/resources/flume

# -- Sqoop 
SQOOP_RELEASE=sqoop-1.4.7.bin__hadoop-2.6.0
SQOOP_ARCHIVE=${SQOOP_RELEASE}.tar.gz
SQOOP_MIRROR_DOWNLOAD=http://mirror.ox.ac.uk/sites/rsync.apache.org/sqoop/1.4.7/${SQOOP_ARCHIVE}
SQOOP_RES_DIR=/vagrant/resources/sqoop

# -- MariaDB
MYSQL_ROOT_PASSWORD=root
JAVA_HOME="/usr/lib/jvm/java-1.7.0"
JAVA_MYSQL_CONNECTOR_VERSION=5.1.40
JAVA_MYSQL_CONNECTOR_JAR=mysql-connector-java-${JAVA_MYSQL_CONNECTOR_VERSION}.jar
JAVA_MYSQL_CONNECTOR_DOWNLOAD=http://central.maven.org/maven2/mysql/mysql-connector-java/${JAVA_MYSQL_CONNECTOR_VERSION}/mysql-connector-java-${JAVA_MYSQL_CONNECTOR_VERSION}.jar

function passwordlessSSH {
	cp -pRv /vagrant/resources/common/{id_rsa,id_rsa.pub,authorized_keys} /root/.ssh/ 
}

function resourceExists {
	FILE=/vagrant/resources/$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}