FROM python:3-slim

RUN apt-get update
RUN apt-get install -y \
  curl imagemagick calibre \
  libxml2-dev libxslt-dev

WORKDIR /app

ARG VERSION

RUN curl -fsSL "https://github.com/janeczku/calibre-web/releases/download/${VERSION}/calibreweb-0.6.24.tar.gz" | \
  tar xz --strip-components 1

RUN python3 -m pip install calibreweb calibreweb[metadata]

RUN mkdir -p library
RUN curl -o library/metadata.db \
  "https://raw.githubusercontent.com/janeczku/calibre-web/refs/heads/master/library/metadata.db"

EXPOSE 8083/tcp

ENTRYPOINT [ "python3", "/app/src/calibreweb" ]
