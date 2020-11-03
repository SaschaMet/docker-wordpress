# chmod +x ./install.sh

echo "============================================"
echo "A robot is now installing everything for you."
echo "============================================"

# create the wordpress & plugins dir
mkdir plugins
mkdir wordpress

# copy wp-graphql
cp ./wp-graphql-0.9.1.zip ./plugins/wp-graphql-0.9.1.zip

# copy wp-graphql
cp ./wp-graphiql-master.zip ./plugins/wp-graphiql-master.zip

cd plugins

# unzip
tar -zxvf wp-graphql-0.9.1.zip
tar -zxvf wp-graphiql-master.zip

rm wp-graphql-0.9.1.zip
rm wp-graphiql-master.zip

# run docker-compose up
docker-compose up -d

# copy wp-install command
cp ./install_wordpress.sh ./wordpress/install_wordpress.sh

# install wordpress
docker-compose run --rm cli bash ./install_wordpress.sh