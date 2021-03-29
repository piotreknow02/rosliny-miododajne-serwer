FROM hayd/alpine-deno:latest

RUN apk update && \
    apk upgrade
ADD . /home/rosliny/
WORKDIR /home/project/
CMD [ "run", "server.ts" ]

# docker build -t rosliny .
# docker run rosliny