#!/bin/bash
set -e
cd "$(mktemp -d)"
git clone https://github.com/nibble-training/gitops.git
cd gitops
echo "new git repo is in:"
pwd

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
echo "you might want to commit with \`git commit -am myfile\`"
