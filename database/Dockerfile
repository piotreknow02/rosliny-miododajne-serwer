FROM mysql:latest

RUN apt-get install mysql-client
ENV MYSQL_ROOT_PASSWORD=
ADD . /home/rosliny/
WORKDIR /home/rosliny
CMD ["mysql", "-u root", "-p ${MYSQL_ROOT_PASSWORD}", " < rosliny.sql"]
# docker build rosliny-db
# docker run -p 3307:3307 rosliny-db