set -o allexport
source ".env"
set +o allexport

tmpfile=$(mktemp)

#mysqldump -P $REMOTE_MYSQL_PORT -h $REMOTE_MYSQL_HOST -u $REMOTE_MYSQL_USER $REMOTE_MYSQL_DB --password=$REMOTE_MYSQL_PASSWORD > $tmpfile

#docker exec -i CONTAINER /usr/bin/mysql -u root --password=root DATABASE < backup.sql
#mysql -u root -p $LOCAL_DATABASE_NAME < $tmpfile
#mysql -uroot -pPASSWORD $LOCAL_DATABASE_NAME -e "update wp_uibgns_options set option_value='http://localhost' where option_name='siteurl'"
#mysql -uroot -pPASSWORD $LOCAL_DATABASE_NAME -e "update wp_uibgns_options set option_value='http://localhost' where option_name='home'"
#rsync -avzh dll_admin@lovelanguages.melaniehoff.com:/home/dll_admin/lovelanguages.melaniehoff.com/wp-content/uploads/ ./wp-content/uploads/
