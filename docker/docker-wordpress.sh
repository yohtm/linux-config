# Script to setup docker wordpress + mysql working with jwilder/nginx-proxy (https://github.com/jwilder/nginx-proxy)
docker run --name photo-mysql -e MYSQL_ROOT_PASSWORD=my_password -d mysql:latest
docker run --name photo-wp --link photo-mysql:mysql -e VIRTUAL_HOST=_my_hostname --expose 80 -d wordpress
