# !/bin/sh

# -uroot : Se connecte en tant que root.
# -e : Exécute la commande suivante.
# ${DB} : Nom de la base de données.
# ${DB_USER} : Nom de l'utilisateur.
# ${DB_USER_PSW} : Mot de passe de l'utilisateur.

# Crée la base de données, et vérifie si elle existe avant.
mariadb -uroot -e "CREATE DATABASE IF NOT EXISTS ${DB};"

# Crée un user, et vérifie s'il existe avant et y ajoute un mot de passe.
mariadb -uroot -e "CREATE USER IF NOT EXISTS ${DB_USER} '@localhost' IDENTIFIED BY ${DB_USER_PSW};"

# Donne tous les privilèges aux users crée précédemment.
mariadb -uroot -e "GRANT ALL PRIVILEGES ON ${DB} TO ${DB_USER} '@'%' IDENTIFIED BY ${DB_USER_PSW};"

# Fait patienter les enfants en attendant les parents. 
mariadb-admin -uroot -p $MYSQL_ROOT_PASSWORD --wait-for-all-slaves shutdown
