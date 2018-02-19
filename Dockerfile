FROM buildpack-deps:xenial

LABEL maintainer="frederik@progras.dk"
LABEL version="0.3"

RUN set -ex \
  \
  && buildDeps=' \
    bison \
    libgdbm-dev \
    lmodern \
    texlive \
    texlive-lang-english \
    texlive-lang-european \
    texlive-latex-extra \
    texlive-latex-recommended \
    texlive-math-extra \
    texlive-pictures \
    texlive-science \
    biber \
    texlive-bibtex-extra \
    latexmk \
    python-pip \
  ' \
  && apt-get update \
  && apt-get install -y --no-install-recommends $buildDeps \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean \
  && pip install --upgrade pip \
  && pip install Pygments
