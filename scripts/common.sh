#!/usr/bin/env bash

# -- hadoop
HADOOP_PREFIX=/usr/local/hadoop
HADOOP_CONF=$HADOOP_PREFIX/etc/hadoop
HADOOP_VERSION=hadoop-2.7.2
HADOOP_ARCHIVE=$HADOOP_VERSION.tar.gz
HADOOP_MIRROR_DOWNLOAD=http://archive.apache.org/dist/hadoop/core/$HADOOP_VERSION/$HADOOP_ARCHIVE
HADOOP_RES_DIR=/vagrant/resources/hadoop

# -- Yarn
HADOOP_YARN_HOME=$HADOOP_PREFIX

# -- hive
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