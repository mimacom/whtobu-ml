#!/bin/bash

if [ ! -d "ml" ]; then
    pip install virtualenv
    virtualenv --python=python2.7 ml
fi

source activate.sh
pip install -r requirements.txt

