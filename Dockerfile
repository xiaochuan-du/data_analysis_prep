FROM python:3.6
MAINTAINER Kevin
COPY sources.list /etc/apt/
RUN apt-get update && apt-get upgrade -y --force-yes
RUN apt-get install -y --force-yes build-essential libssl-dev libffi-dev python-dev python-pip libsasl2-dev libldap2-dev
RUN mkdir ~/.pip
COPY pip.conf ~/.pip/pip.conf
COPY requirements.txt .
RUN ["pip","install","-r","requirements.txt"]
LABEL version="1.0" \
      description="This image is used to set up sever."
