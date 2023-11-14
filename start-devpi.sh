#!/bin/sh

devpi-server --host=0.0.0.0 --serverdir /devpi &
sleep 15 #wait for the server to come online

python --version
pip download --no-cache-dir --requirement ./requirements.txt --index http://localhost:3141/root/pypi/ --timeout 120
