#!/bin/bash -e

if [ -z "$1" ]; then
  echo 'input layer directory'
  exit
fi

cd $1

ZIPNAME=$(basename `pwd`).zip

rm -rf nodejs/

mkdir nodejs

cp *.json nodejs/

cd nodejs

docker run --rm -v "$PWD":/var/task/ lambci/lambda:build-nodejs10.x npm install

cd ..

zip -r ${ZIPNAME} nodejs/

rm -rf nodejs/

mv ${ZIPNAME} ../
