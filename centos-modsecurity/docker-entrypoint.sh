#!/bin/bash
set -euo pipefail

# usage: file_env VAR [DEFAULT]
#    ie: file_env 'XYZ_DB_PASSWORD' 'example'
# (will allow for "$XYZ_DB_PASSWORD_FILE" to fill in the value of
#  "$XYZ_DB_PASSWORD" from a file, especially for Docker's secrets feature)
file_env() {
	local var="$1"
	local fileVar="${var}_FILE"
	local def="${2:-}"
	if [ "${!var:-}" ] && [ "${!fileVar:-}" ]; then
		echo >&2 "error: both $var and $fileVar are set (but are exclusive)"
		exit 1
	fi
	local val="$def"
	if [ "${!var:-}" ]; then
		val="${!var}"
	elif [ "${!fileVar:-}" ]; then
		val="$(< "${!fileVar}")"
	fi
	export "$var"="$val"
	unset "$fileVar"
}

#file_env $1 $2
#env | grep -A 2 -B 2 $1
# VAR_CUSTOM_VHOST, VAR_DB_HOST, VAR_DB_PORT, VAR_DB_DATABASE, VAR_DB_USER, VAR_DB_PASSWORD
envs=(
VAR_DB_HOST
VAR_DB_DATABASE
VAR_DB_USER
VAR_DB_PASSWORD
)

for e in "${envs[@]}"; do
	file_env "$e"
done

# Assume all variable has been set, try use it
# Copy jutsu, from wordpress
TERM=dumb php -- <<'EOPHP'
<?php
// database might not exist, so let's try creating it (just to be safe)

$stderr = fopen('php://stderr', 'w');

// https://codex.wordpress.org/Editing_wp-config.php#MySQL_Alternate_Port
//   "hostname:port"
// https://codex.wordpress.org/Editing_wp-config.php#MySQL_Sockets_or_Pipes
//   "hostname:unix-socket-path"
list($host, $socket) = explode(':', getenv('VAR_DB_HOST'), 2);
$port = 0;
if (is_numeric($socket)) {
	$port = (int) $socket;
	$socket = null;
}
$user = getenv('VAR_DB_USER');
$pass = getenv('VAR_DB_PASSWORD');
$dbName = getenv('VAR_DB_DATABASE');
/*
$maxTries = 10;
do {
	$mysql = new mysqli($host, $user, $pass, '', $port, $socket);
	if ($mysql->connect_error) {
		fwrite($stderr, "\n" . 'MySQL Connection Error: (' . $mysql->connect_errno . ') ' . $mysql->connect_error . "\n");
		--$maxTries;
		if ($maxTries <= 0) {
			exit(1);
		}
		sleep(3);
	}
} while ($mysql->connect_error);

if (!$mysql->query('CREATE DATABASE IF NOT EXISTS `' . $mysql->real_escape_string($dbName) . '`')) {
	fwrite($stderr, "\n" . 'MySQL "CREATE DATABASE" Error: ' . $mysql->error . "\n");
	$mysql->close();
	exit(1);
}

$mysql->close();
*/
echo $host."-".$port."-".$pass."-".$dbName;
EOPHP

# After creating database, try to create config file
# Copy jutsu again
# see http://stackoverflow.com/a/2705678/433558
sed_escape_lhs() {
	echo "$@" | sed -e 's/[]\/$*.^|[]/\\&/g'
}
sed_escape_rhs() {
	echo "$@" | sed -e 's/[\/&]/\\&/g'
}
php_escape() {
	local escaped="$(php -r 'var_export(('"$2"') $argv[1]);' -- "$1")"
	if [ "$2" = 'string' ] && [ "${escaped:0:1}" = "'" ]; then
		escaped="${escaped//$'\n'/"' + \"\\n\" + '"}"
	fi
	echo "$escaped"
}
set_config() {
	key="$1"
	value="$2"
	var_type="${3:-string}"
	start="(['\"])$(sed_escape_lhs "$key")\2\s*,"
	end="\);"
	if [ "${key:0:1}" = '$' ]; then
		start="^(\s*)$(sed_escape_lhs "$key")\s*="
		end=";"
	fi
	sed -ri -e "s/($start\s*).*($end)$/\1$(sed_escape_rhs "$(php_escape "$value" "$var_type")")\3/" config.php
}

# Try create default config.php with this entrypoint
cat > config.php << 'END'
<?php
	define('db_host','localhost');
	define('db_user','root');
	define('db_pass','password');
	define('db_name','somedb');
	
	mysql_connect(db_host,db_user,db_pass);
	mysql_select_db(db_name);
?>
END

# And then modify it
set_config 'db_host' "$VAR_DB_HOST"
set_config 'db_user' "$VAR_DB_USER"
set_config 'db_pass' "$VAR_DB_PASSWORD"
set_config 'db_name' "$VAR_DB_DATABASE"

# To test it, i create index.php that read the config.php
cat > index.php << '_END_'
<?php
$a = file_get_contents("config.php");
echo "Isi config.php seperti berikut : <br><hr>";
echo "<pre>".htmlentities($a)."</pre>";
?>
_END_

# Clear our env
for e in "${envs[@]}"; do
	unset "$e"
done

exec "$@"