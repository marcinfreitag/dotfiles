#!/usr/bin/bash
# Backup gpg keys for all identities
# Creates gpg-backup.tar.gz in the curent directory
# Source: https://access.redhat.com/solutions/2115511


archive_dir=$(pwd)

pushd ~

# display keys

gpg --list-secret-keys --keyid-format LONG

# backup public and private keys as well as the trusted database
gpg -a --export >pubkeys.asc
gpg -a --export-secret-keys >privatekeys.asc
gpg --export-ownertrust > otrust.txt

# add files to an archive
tar -czvf $archive_dir/gpg-backup.tar.gz pubkeys.asc privatekeys.asc otrust.txt .gnupg/gpg-agent.conf .gnupg/sshcontrol .ssh/config

# shred temporary files
shred -u pubkeys.asc privatekeys.asc otrust.txt

popd
unset archive_dir
