#!/bin/bash

eval "$(pyenv init -)"
for VER in $(cat pyenv-versions); 
do 
    pyenv shell $VER && pyenv exec pip install --upgrade pip; 
done
pyenv shell --unset

