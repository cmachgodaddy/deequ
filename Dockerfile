FROM maven:3.5-jdk-8 AS build

RUN apt-get upgrade
COPY . /usr/src/app/deequ
RUN mvn -f /usr/src/app/deequ/pom.xml clean package -DargLine="-Xms128m -Xms512m -XX:MaxPermSize=300m -ea"

# to keep the container running
ENTRYPOINT ["tail", "-f", "/dev/null"]

# to download jar from container to host run:
# 1. docker ps , and get the container id
# 2. docker cp 69b2be0e49d9:/usr/src/app/deequ/target ~/Downloads/target/  (2d4e61d269fb: is the container id)