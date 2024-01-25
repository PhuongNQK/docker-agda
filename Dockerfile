FROM haskell:9.8.1-slim

RUN cabal update && cabal install cabal-install alex happy Agda
RUN apt-get update && apt-get install -y emacs
RUN agda-mode setup

RUN cd ~ && git clone https://github.com/agda/agda-stdlib.git
RUN cd ~ && mkdir .agda && cd .agda && echo "standard-library" >> defaults && echo "~/agda-stdlib/standard-library.agda-lib" >> libraries