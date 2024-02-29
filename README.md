# Marcin's dotfiles

The dotfiles are managed using [chezmoi](https://www.chezmoi.io/).

## Getting started

Check out the [Quick Start](https://www.chezmoi.io/quick-start/) page.

### Install chezmoi and the dotfiles on any new machine

With a single command (public):

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin -- init --apply MarcinFreitag
```

or (private):

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin -- init --apply git@github.com:MarcinFreitag/dotfiles.git
```
### Update

On any machine, you can pull and apply the latest changes from your repo with:

```sh
chezmoi update -v
```
