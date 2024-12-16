FROM debian:bookworm

RUN sudo apt update
RUN sudo apt install mariadb-server -y

EXPOSE 3306

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod 777 /bin/startup.sh

CMD ["startup.sh"]
