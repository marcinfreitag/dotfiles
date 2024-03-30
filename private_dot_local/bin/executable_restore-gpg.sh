#!/usr/bin/bash
# Restore gpg keys for all identities from gpg-backup.tar.gz
# run the script in the same directory as the archive
# Source: https://www.howtogeek.com/816878/how-to-back-up-and-restore-gpg-keys-on-linux/

archive_dir=$(pwd)

pushd ~


tar -xvzf $archive_dir/gpg-backup.tar.gz

# backup public and private keys as well as the trusted database
gpg --import public.gpg
gpg --import private.gpg
gpg --import-ownertrust trust.gpg

# shred temporary files
shred -u public.gpg private.gpg trust.gpg

# display directory structure of .gnupg
#tree .gnupg

# display keys
#gpg --list-secret-keys --keyid-format LONG

popd
unset archive_dir




