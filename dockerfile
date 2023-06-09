FROM python:3.9-alpine3.13

LABEL maintainer ="Sumeyask6@gmail.com"

ENV PYTHONBUFFERED 1
COPY ./requirements.txt /tmp/requirements.txt 

COPY ./app /app

WORKDIR /app

EXPOSE 800

RUN python -m venv /py &&\ 
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    adduser --disabled-password django-user

ENV PATH='/py/bin:$PATH'

USER django-user


