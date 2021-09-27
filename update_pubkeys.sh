#!/bin/bash
KEYID="117A020A52B73DE56F58AB44C61C42632C5952F3"

gpg --export --export-options export-minimal --armor $KEYID > ~/Downloads/pubkey_minimal.asc
gpg --export --armor $KEYID > ~/Downloads/pubkey.asc
cd ~/Downloads
rsync pubkey*.asc selfoss:/var/www/baert.jp.net/static
