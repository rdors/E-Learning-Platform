#!/bin/bash

echo "Removing existing live folder and creating new one"
if [ -e "cakephp.zip" ]; then
	rm cakephp.zip
fi

if [ -d "live" ]; then
	rm -rf live
fi

mkdir live
cd live

echo "Downloading current cakePHP version from github.com"
curl --connect-timeout 10  -o cakephp.zip https://nodeload.github.com/cakephp/cakephp/zipball/master

if [ -e "cakephp.zip" ]; then
	echo "Unzipping cakePHP and setting-up cakePHP installation"
	unzip cakephp.zip && mv cakephp.zip ../cakephp.zip
	mv cakephp-* cake-src
	mv cake-src/* . && rm -rf cake-src
else
	echo "Was not able to download the current cakephp version from github.com"
	echo "Please try later."
	return 0
fi

echo "Setting up e-learning platform"
rsync -Curz ../src/ .

echo "Done."


