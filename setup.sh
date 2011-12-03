#!/bin/bash

rm -rf live && mkdir live
cd live
curl --ssl --connect-timeout 10 --get https://github.com/cakephp/cakephp/zipball/master -o cakephp.zip
unzip cakephp.zip
rsync -Curz ../src/ .

