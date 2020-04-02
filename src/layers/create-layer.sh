#!/bin/bash -e

if [ -z "$1" ]; then
  echo 'input layer directory'
  exit
fi

cd $1

ZIPNAME=$(basename `pwd`).zip

rm -rf python/

mkdir python

cp requirements.txt python/

cd python

docker run --rm -v "$PWD":/var/task/ lambci/lambda:build-python3.8 pip install -t ./ -r requirements.txt

rm requirements.txt

cd ..

zip -r ${ZIPNAME} python/

rm -rf python/

mv ${ZIPNAME} ../
