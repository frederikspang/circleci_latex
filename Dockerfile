FROM buildpack-deps:disco

LABEL maintainer="frederik@progras.dk"
LABEL version="0.6"

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
    texlive-science \
    texlive-pictures \
    texlive-science \
    biber \
    texlive-bibtex-extra \
    latexmk \
    python-dev \
    python-pip \
' && apt-get update \
  && apt-get install -y --no-install-recommends $buildDeps \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

WORKDIR /tmp
COPY aliases.sh /tmp
SHELL [ "/tmp/aliases.sh" ]

RUN tlmgr init-usertree
# RUN tlmgr conf tlmgr persistent-downloads 0

RUN tlmgr install inconsolata

RUN pip install --upgrade pip==9.0.3 \
  && pip install Pygments
