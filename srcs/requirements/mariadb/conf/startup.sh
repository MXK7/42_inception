# !/bin/sh

# Crée la base de données, et vérifie si elle existe avant.
mariadb -uroot -e "CREATE DATABASE IF NOT EXISTS ${DB};"

# Crée un user, et vérifie s'il existe avant et y ajoute un mot de passe.
mariadb -uroot -e "CREATE USER IF NOT EXISTS ${DB_USER} '@localhost' IDENTIFIED BY ${DB_USER_PSW};"

# Donne tous les privilèges aux users crée précédemment.
mariadb -uroot -e "GRANT ALL PRIVILEGES ON ${DB} TO ${DB_USER} '@'%' IDENTIFIED BY ${DB_USER_PSW};"

# 
mariadb-admin -uroot -p$MYSQL_ROOT_PASSWORD --wait-for-all-slaves shutdown
