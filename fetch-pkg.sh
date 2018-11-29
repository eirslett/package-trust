#!/bin/bash
DIR="packages/$PACKAGE/$VERSION"

rm -rf $DIR
mkdir -p $DIR
mkdir "$DIR/extracted"
(cd $DIR; npm pack "$PACKAGE@$VERSION")
tar xf "$DIR/$PACKAGE-$VERSION.tgz" -C "$DIR/extracted" --strip-components=1
