FROM buildpack-deps:xenial

RUN set -ex \
  \
  && buildDeps=' \
    bison \
    libgdbm-dev \
    texlive-full \
    texlive-latex-extra \
    texlive-latex-recommended \
    biber \
    texlive-bibtex-extra \
    latexmk \
  ' \
  && apt-get update \
  && apt-get install -y --no-install-recommends $buildDeps \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean
