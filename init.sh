#!/bin/bash

if [ ! -d "ml" ]; then
    pip install virtualenv
    virtualenv ml
fi

source activate.sh
pip install -r requirements.txt
