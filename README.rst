Big Data Development Lab
========================

Introduction
------------

If you are looking to setup Hadoop for local development, you are in the right place :) 

This repository will help you create AIO Hadoop VM on you local machine with entire Hadoop Ecosystem. 

* Hadoop 2.7.2
* Hive 1.2.1
* Pig 0.17.0
* Flume 1.7.0
* Sqoop 1.4.6 
* Zeppelin 0.8.0

Installation
------------

The setup has been tested with Vagrant & Cent7

.. code-block::

  vagrant box add centos/7
  vagrant plugin install vagrant-vbguest
  vagrant up
  vagrant ssh

Hadoop
------
To setup hadoop (HDFS & YARN), run the following as `root`

.. code-block::
 
  /vagrant/scripts/setup_hadoop.sh

To start/stop hadoop

.. code-block::

  /vagrant/scripts/start-hadoop.sh
  /vagrant/scripts/stop-hadoop.sh

To access the HDFS CLI

.. code-block::

  /usr/local/hadoop/bin/hdfs dfs -ls /

Hive
----
To setup Hive, run the following as `root`

.. code-block::
 
  /vagrant/scripts/setup_hive.sh

To start hive

.. code-block::

  /vagrant/scripts/start-hive.sh

To access the hive CLI

.. code-block::

  /usr/local/hive/bin/hive

Pig
---
To setup Pig, run the following as `root`

.. code-block::

  /vagrant/scripts/setup_pig.sh ⏎

To access the Pig CLI

.. code-block::

  /usr/local/pig/bin/pig ⏎

Flume
-----
To setup Flume, run the following as `root`

.. code-block::

    /vagrant/scripts/setup_flume.sh

Sqoop
-----
To setup Sqoop, run the following as `root`

.. code-block::

    /vagrant/scripts/setup_sqoop.sh   
    /vagrant/scripts/setup_mysql.sh    

Zeppelin
--------
To setup Zeppelin, run the following as `root`

.. code-block::

  /vagrant/scripts/setup_zepplin.sh

To start Zeppelin,

.. code-block::

  /root/zeppelin/bin/zeppelin-daemon.sh start

Zeppelin interpreters can be added into `/root/zeppelin/interpreter` directory.
To add MySQL interpreter, go to UI > create interpreter (like "mysql") and select the “jdbc” interpreter group. 
From here you will be able to configure your MySQL JDBC connection.

Here are needed settings:

default.driver = com.mysql.jdbc.Driver
default.user   = (username used to login)
default.pw     = (password used to login)
default.url    =  jdbc:mysql://localhost:3306/ (host and port used to connect to MySQL)
	
In the “Dependencies” section, you must specify the artifact of the MySQL Connector JAR that we previously downloaded. 
We downloaded version 5.1.40 into `/root/zeppelin/interpreter/mysql`,so the artifact is mysql:mysql-connector-java:5.1.40.


Web Interfaces
==============

* HDFS NameNode http://192.168.33.10:50070/
* HDFS DataNode http://192.168.33.10:50075/
* YARN Resource Manager http://192.168.33.10:8088/cluster 
* YARN JobHistoryServer http://192.168.33.10:19888/jobhistory/
* Zeppelin http://192.168.33.10:8080/

TODO
====

* Solr & Lucene
* Mahout
* Storm
* HBase
* Spark
* Drill
* Tez
* Oozie

References
==========

This lab based on the following excellent works:

* Martin Robson https://github.com/martinprobson/vagrant-hadoop-hive-spark
* Alex Holmes https://github.com/alexholmes/vagrant-hadoop-spark-hive
* Hive details at https://www.tutorialspoint.com/hive/hive_installation.htm
* Zeppelin MySQL Connector http://bigdatums.net/2017/03/02/connecting-apache-zeppelin-to-mysql/
* https://www.edureka.co/blog/hadoop-ecosystem
