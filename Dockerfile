# pull official base image
FROM python:3.9.19-slim-bullseye

# set work directory
WORKDIR /app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install mysql dependencies
RUN apt-get update
# RUN apt-get install gcc default-libmysqlclient-dev -y
RUN apt-get install python3-dev default-libmysqlclient-dev build-essential pkg-config -y

# install dependencies
# RUN pip install -U pip setuptools wheel
# RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy project
COPY . .

# Convert plain text files from Windows or Mac format to Unix
# RUN apt-get install dos2unix
# RUN dos2unix --newfile docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Make entrypoint executable
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Entrypoint dependencies to run nc -z
RUN apt-get install netcat -y

# run entrypoint.sh
ENTRYPOINT ["bash", "docker-entrypoint.sh"]