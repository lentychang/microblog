FROM python:3.6-slim-buster

RUN adduser --disabled-password microblog
WORKDIR /home/microblog
COPY requirements.txt requirements.txt

RUN apt-get update && apt-get install -y enchant g++ make libffi-dev openssl unixodbc unixodbc-dev gnupg curl
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update && ACCEPT_EULA=Y apt-get -y install msodbcsql17
RUN python -m venv venv
RUN venv/bin/pip install --upgrade pip
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn pymysql
COPY app app
COPY migrations migrations
COPY microblog.py config.py Docker/boot.sh ./
RUN chmod +x boot.sh

ENV FLASK_APP microblog.py
RUN chown -R microblog:microblog ./

USER microblog

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
