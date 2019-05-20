#!/bin/bash
set -e

if [ ! -e ~/.dropbox-dist ]; then
	cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -
fi

cd ~/.dropbox-dist
DROPBOX_DIR=$(realpath $(ls -tr | grep dropbox-lnx))

if [ ! -e $DROPBOX_DIR/dropbox.i686 ]; then
	echo "Setting up dropbox (x86) to be run with qemu..."
	cd ${DROPBOX_DIR}
	mv dropbox dropbox.i686
	echo "qemu-i386 -L /usr/i686-linux-gnu/ $DROPBOX_DIR/dropbox.i686" > ${DROPBOX_DIR}/dropbox
	chmod +x ${DROPBOX_DIR}/dropbox
	cd ..
fi

echo "Running dropbox (x86) qemu."
~/.dropbox-dist/dropboxd