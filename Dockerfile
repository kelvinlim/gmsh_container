FROM python:3.11

WORKDIR /app

RUN apt update
RUN apt upgrade -y
RUN apt install -y git
RUN apt install -y --upgrade gmsh

#ENTRYPOINT ["/usr/bin/gmsh"]
