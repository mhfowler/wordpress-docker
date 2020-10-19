set -o allexport
source ".env"
set +o allexport


echo "--- Logging into SSH server (${REMOTE_SSH_HOST}) and scanning wp-config.php to get wordpress table_prefix..."

wpconfigtmpfile=$(mktemp)
#wpconfigtmpfile=~/Downloads/tempwpconfig.php

scp "$REMOTE_SSH_USER"@"$REMOTE_SSH_HOST":~/"$REMOTE_SSH_WP_DIRECTORY"/wp-config.php $wpconfigtmpfile

wp_table_prefix=$(./get_table_prefix_from_wp_config.py $wpconfigtmpfile)

echo "   - WE got it: table_prefix = ${wp_table_prefix}"

export WP_TABLE_PREFIX=$wp_table_prefix




echo "--- running docker-compose up -d"

docker-compose up -d




sqltmpfile=$(mktemp)
#sqltmpfile=~/Downloads/temp.sql

echo "--- Doing a MYSQL dump of the remote server (${REMOTE_MYSQL_HOST}) and copying it to a local temporary file... (${sqltmpfile})"


export MYSQL_PWD=$REMOTE_MYSQL_PASSWORD


mysqldump  -h "$REMOTE_MYSQL_HOST" -P "$REMOTE_MYSQL_PORT" -u "$REMOTE_MYSQL_USER" --databases "$REMOTE_MYSQL_DBNAME" --column-statistics=0  > $sqltmpfile






MSCONTAINERNAME="wordpress-docker_mysql_${PROJECT_NICKNAME}"
WPCONTAINERNAME="wordpress-docker_wordpress_${PROJECT_NICKNAME}"

echo "--- Loading MYSQL dump into local Docker database (${MSCONTAINERNAME})"


docker exec -i "$MSCONTAINERNAME" /usr/bin/mysql -u root --password=somewordpress  < $sqltmpfile



echo "--- Setting our Docker database so that the wordpress installation site points to localhost..."


docker exec -i "$MSCONTAINERNAME" /usr/bin/mysql -u root --password=somewordpress "$REMOTE_MYSQL_DBNAME" -e "update ${wp_table_prefix}options set option_value='http://localhost' where option_name='siteurl'"
docker exec -i "$MSCONTAINERNAME" /usr/bin/mysql -u root --password=somewordpress "$REMOTE_MYSQL_DBNAME" -e "update ${wp_table_prefix}options set option_value='http://localhost' where option_name='home'"



echo "--- Copying/Rsyncing remote database to our local wp-content folder..."

rsync -avzh "$REMOTE_SSH_USER"@"$REMOTE_SSH_HOST":~/"$REMOTE_SSH_WP_DIRECTORY"/wp-content/uploads/ ./wp-content/uploads/

