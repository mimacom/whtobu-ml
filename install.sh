#!/bin/bash

if [ which pip3 >/dev/null ]; then
	echo "pip3 is required"
fi

if [ which python3 >/dev/null ]; then
        echo "python3 is required"
fi

pip3 install virtualenv
python3 -m virtualenv whtobu
source whtobu/bin/activate
pip3 install -r requirements.txt

deactivate