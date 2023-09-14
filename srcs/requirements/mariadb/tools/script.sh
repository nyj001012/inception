#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
	chown -R mysql:mysql /var/lib/mysql

	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

	tfile='mktemp'
	if [ ! -f "$tfile" ]; then
		return 1
	fi
fi

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
	cat << EOF > /tmp/create_database.sql
	USE mysql;
	FLUSH PRIVILEGES;
	DELETE FROM mysql.user WHERE User='';
	DROP DATABASE test;
	DELETE FROM mysql.db WHERE Db='test;
	DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
	CREATE DATABASE ${MYSQL_DATABASE} CHARACTER SET utf8 COLLATE utf8_general_ci;
	CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
	GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
	FLUSH PRIVILEGES;
EOF
	/usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_database.sql
	rm -f /tmp/create_database.sql
fi
