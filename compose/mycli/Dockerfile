FROM python:3.11.1-slim-bullseye

ARG DEBIAN_FRONTEND=noninteractive

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

ENV MYCLI_VERSION 1.26.1

RUN apt-get update && apt-get install less -y

RUN pip3 install mycli==${MYCLI_VERSION}

ENTRYPOINT ["/usr/local/bin/mycli"]
CMD ["--help"]
