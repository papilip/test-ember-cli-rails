#!/bin/bash

environment=''
if [ -n "$1" ]
then
  environment=$1
else
  echo 'Usage: ./start.sh [platform=development]'
  environment='development'
fi

bundle exec bin/rails server --binding=0.0.0.0 --environment=$environment --port=3002
