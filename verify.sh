#!/bin/bash
DIR="signatures/$PACKAGE/$VERSION/*.sig"

for f in $DIR
do
	echo "Verifying $f"
    gpg --verify $f
done
