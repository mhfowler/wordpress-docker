mysqldump -P 3306 -h mysql.lovelanguages.melaniehoff.com -u localdlluser lovelanguages_melaniehof -p > ~/Desktop/wp.sql
mysql -u root -p LOCAL_DATABASE_NAME < ~/Desktop/wp.sql
mysql -uroot -pPASSWORD LOCAL_DATABASE_NAME -e "update wp_uibgns_options set option_value='http://localhost' where option_name='siteurl'"
mysql -uroot -pPASSWORD LOCAL_DATABASE_NAME -e "update wp_uibgns_options set option_value='http://localhost' where option_name='home'"
rsync -avzh dll_admin@lovelanguages.melaniehoff.com:/home/dll_admin/lovelanguages.melaniehoff.com/wp-content/uploads/ ./wp-content/uploads/
