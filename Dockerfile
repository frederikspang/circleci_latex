FROM buildpack-deps:xenial

LABEL maintainer="frederik@progras.dk"
LABEL version="0.5"

RUN set -ex \
  \
  && buildDeps=' \
    xzdec \
    bison \
    libgdbm-dev \
    lmodern \
    texlive \
    texlive-fonts-recommended \
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
  && apt-get clean

RUN tlmgr init-usertree; exit 0
RUN tlmgr conf tlmgr persistent-downloads 0
RUN tlmgr option repository ftp://tug.org/historic/systems/texlive/2015/tlnet-final
RUN tlmgr install inconsolata

RUN  pip install --upgrade pip \
  && pip install Pygments
