#!/bin/bash

docker rmi jupyter-image
rm -r .ipynb_checkpoints
rm -r .ipython
rm -r .jupyter
rm -r .local
rm .bash_history
