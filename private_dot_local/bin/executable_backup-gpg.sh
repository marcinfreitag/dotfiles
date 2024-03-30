#!/usr/bin/bash
# Backup gpg keys for all identities
# Creates gpg-backup.tar.gz in the curent directory
# Source: https://www.howtogeek.com/816878/how-to-back-up-and-restore-gpg-keys-on-linux/


archive_dir=$(pwd)

pushd ~

# display keys

gpg --list-secret-keys --keyid-format LONG

# backup public and private keys as well as the trusted database
gpg --export --export-options backup --output public.gpg
gpg --export-secret-keys --export-options backup --output private.gpg
gpg --export-ownertrust > trust.gpg

# add files to an archive
tar -czvf $archive_dir/gpg-backup.tar.gz private.gpg public.gpg trust.gpg .gnupg/gpg-agent.conf .gnupg/sshcontrol .ssh/config

# shred temporary files
shred -u private.gpg public.gpg trust.gpg

popd
unset archive_dir
