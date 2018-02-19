# CircleCI Build File for Latex-files.


## Example with main.tex, and upload to artifacts.

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
