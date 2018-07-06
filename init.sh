#!/bin/bash

sudo pip install --upgrade pip

if [ ! -d "ml" ]; then
    sudo pip install virtualenv
    virtualenv --python=python2.7 ml
fi

source activate.sh
pip install -r requirements.txt

