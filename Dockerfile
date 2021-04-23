FROM hayd/ubuntu-deno:latest

ADD . /home/project/
WORKDIR /home/project/
CMD ["run", "--allow-net=0.0.0.0:3000,mysql:3306", "--allow-read=/", "--allow-env=MYSQL_SERVER_ADDR,MYSQL_ROOT_PASSWORD", "server.ts"]

# docker build -t rosliny-server .
# docker run rosliny-server