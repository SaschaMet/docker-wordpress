# docker-compose run --rm cli bash ./install_wordpress.sh

# dev install
wp core install --url=localhost --title=demo --admin_user=smet --admin_password=1234 --admin_email=me@saschametzger.com

# update core and db, install languages and verify installation
wp core update
wp core update-db
wp core language install de_DE
wp core language activate de_DE
wp core language update
wp language core update
wp core verify-checksums

# update current theme
wp theme delete twentynineteen
wp theme update twentytwenty

# delete all preinstalled plugins
wp plugin delete akismet
wp plugin delete hello

# install needed plugins
wp plugin install wp-smushit
wp plugin install woocommerce
wp plugin install wp-headless
wp plugin install wp-rest-cache

# update plugins
wp plugin update --all

# update languages
wp language plugin update --all

# activate plugins
wp plugin activate --all

# rewrite permalink structure
wp rewrite structure '/%post%/'