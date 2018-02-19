# CircleCI Build File for Latex-files.


## Example with main.tex, and upload to artifacts.

.circleci/config.yml
```
jobs:
  build:
    docker:
      - image: frederikspang/latex_docker:0.2
    steps:
      - checkout
      - run: cp .latexmkrc ~/.latexmkrc
      - run:
          name: Generating current version
          command: |
            latexmk main.tex;
            mkdir /tmp/artifacts;
            cp main.pdf /tmp/artifacts/
      - store_artifacts:
          path: /tmp/artifacts
```

.latexmkrc (project root)
```
# LaTeXmk configuration file

# Usage example
# latexmk file.tex

# Main command line options
# -pdf : generate pdf using pdflatex
# -pv  : run file previewer
# -pvc : run file previewer and continually recompile on change
# -C   : clean up by removing all regeneratable files

# Generate pdf using pdflatex (-pdf)
$pdf_mode = 1;

# Use bibtex if a .bib file exists
$bibtex_use = 1;

# Define command to compile with pdfsync support and nonstopmode
$pdflatex = 'pdflatex -synctex=1 --interaction=nonstopmode -file-line-error';

# Use default pdf viewer
$pdf_previewer = 'open';

# Also remove pdfsync files on clean
$clean_ext = 'pdfsync synctex.gz';
```
