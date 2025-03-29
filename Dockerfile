# syntax=docker/dockerfile:1

FROM openjdk:17.0.2-jdk-buster

LABEL version="3.16.0.1"
LABEL homepage.group=Minecraft
LABEL homepage.name="Vault Hunters 3rd Edition-3.16.0.1"
LABEL homepage.icon="https://media.forgecdn.net/avatars/651/140/638051446127306822.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=VaultHunters3rdEdition:25565

RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV JAVA_OPTS "-Xms4096m -Xmx4096m"

CMD ["/launch.sh"]