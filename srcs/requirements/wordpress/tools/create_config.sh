#!/bin/sh

if [ -f ./wordpress/wp-config.php ]; then
cat << EOF > /var/www/wp-config.php
	<?php
	define('DB_NAME', '${MYSQL_DATABASE}');
	define('DB_USER', '${MYSQL_USER}');
	define('DB_PASSWORD', '${MYSQL_PASSWORD}');
	define('DB_HOST', '${MYSQL_HOSTNAME}');
	define('DB_CHARSET', 'utf8');
	define('DB_COLLATE', '');
	define('FS_METHOD', 'direct');
	define('WP_DEBUG', false);
	if (!define('ABSPATH')) {
		define('ABSPATH', __DIR__ . '/');
	}
	require_once ABSPATH . 'wp-settings.php';
EOF
fi
