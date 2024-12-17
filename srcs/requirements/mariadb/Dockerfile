FROM debian:bookworm

EXPOSE 3306

RUN sudo apt update
RUN sudo apt install mariadb-server -y
run sudo rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod 777 /bin/startup.sh

CMD ["startup.sh"]
