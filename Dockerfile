FROM ubuntu

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

COPY ./docker/install_jesse.sh .
RUN bash install_jesse.sh
RUN mkdir -p /jesse/app

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1