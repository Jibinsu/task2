# Derived from official MySQL image (our base image)
FROM mysql:5.7

# Use MySQL 5.7 as the flask-app is not set up to work with later versions
# Set the root password and create a new database
# Consult the MySQL 5.7 image documentation for further customization options
ENV MYSQL_ROOT_PASSWORD=password
ENV MYSQL_DATABASE=flask-db

# Add the content of the .sql file to your image
# All scripts copied to /docker-entrypoint-initdb.d/ are automatically
# executed during container startup by the MySQL image
COPY CreateTable.sql /docker-entrypoint-initdb.d/
