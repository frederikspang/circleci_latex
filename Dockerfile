FROM buildpack-deps:xenial

RUN set -ex \
  \
  && buildDeps=' \
    bison \
    libgdbm-dev \
    texlive-full \
  ' \
  && apt-get update \
  && apt-get install -y --no-install-recommends $buildDeps \
  && rm -rf /var/lib/apt/lists/*
