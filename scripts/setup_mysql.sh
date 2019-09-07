#!/bin/bash
source "/vagrant/scripts/common.sh"

function installMysql {
	echo "install mariadb server"
	yum install -y mariadb-server
    systemctl start mariadb.service
}

function setupMysql {
	echo "Allow root access from network..."
	echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" | mysql -u root -P 3306 # Initially no passwd
	echo "Create hive_metastore schema..."
	echo "CREATE SCHEMA hive_metastore;" | mysql -u root -P 3306 
	echo "Create hive meta-db user..."
	echo "CREATE USER 'hive'@'%' IDENTIFIED BY 'hive';" | mysql -u root -P 3306 
	echo "grant permissions to hive meta-db user..."
	echo "GRANT ALL PRIVILEGES ON hive_metastore.* TO 'hive'@'%' IDENTIFIED BY 'hive';" | mysql -u root -P 3306 
	echo "Restarting mysqld for changes to take effect..."
	systemctl restart mariadb.service
	echo "setup of mysql finished"
}

function setupMysqlConnector {
	echo "Mysql java connector setup"
	curl -sS -o ${JAVA_HOME}/lib/${JAVA_MYSQL_CONNECTOR_JAR} -O -L ${JAVA_MYSQL_CONNECTOR_DOWNLOAD}
}

echo "setup mysql"
installMysql
setupMysql
setupMysqlConnector