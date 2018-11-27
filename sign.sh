#!/bin/bash
DIR="signatures/$PACKAGE-$VERSION"
export ARCHIVE="packages/$PACKAGE-$VERSION/$PACKAGE-$VERSION.tgz"
mkdir -p $DIR
node make-message.js | gpg -u $SENDER --yes --output "$DIR/$SENDER.sig" --clearsign
