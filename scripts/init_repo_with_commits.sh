#!/bin/bash
set -e
cd "$(mktemp -d)"
echo "new git repo is in:"
pwd
git init
git config user.email "${USER}@somedomain.org"
git config user.name "$USER"

echo "commits"
date >>myfile
for ((i = 1; i < 10; i++)); do
	echo -n .
	echo $i >>myfile
	git add myfile
	git commit -m "my commit $1"
done

sleep 1
echo "staged"
date >>myfile
for ((i = 1; i < 10; i++)); do
	echo -n .
	echo $i >>myfile
	git add myfile
done

sleep 1
echo "changed"
date >>myfile
for ((i = 1; i < 10; i++)); do
	echo -n .
	echo $i >>myfile
done
echo "new git repo is in:"
pwd
