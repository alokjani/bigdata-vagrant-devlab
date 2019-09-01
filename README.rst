==============
Vagrant Hadoop
==============

Install
=======

.. code-block::

  vagrant box add centos/7
  vagrant plugin install vagrant-vbguest
  vagrant up
  vagrant ssh
  
To setup HDFS & YARN, run the following as `root`

.. code-block::
 
  /vagrant/scripts/setup_hadoop.sh

To start/stop hadoop

.. code-block::

  /vagrant/scripts/start-hadoop.sh
  /vagrant/scripts/stop-hadoop.sh

References
==========

* Hive https://www.tutorialspoint.com/hive/hive_installation.htm

