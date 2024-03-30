#!/usr/bin/bash
# Restore gpg keys for all identities from gpg-backup.tar.gz
# run the script in the same directory as the archive
# Source: https://access.redhat.com/solutions/2115511
archive_dir=$(pwd)

pushd ~

mkdir {.ssh,.gnupg}
chmod 700 .ssh .gnupg

tar -xvzf $archive_dir/gpg-backup.tar.gz

# backup public and private keys as well as the trusted database
gpg --import privatekeys.asc
gpg --import mypubkeys.asc
gpg --import-ownertrust otrust.txt

gpg -K
gpg -k

# shred temporary files
shred -u pubkeys.asc privatekeys.asc otrust.txt

# display directory structure of .gnupg
#tree .gnupg

# display keys
#gpg --list-secret-keys --keyid-format LONG

popd
unset archive_dir




