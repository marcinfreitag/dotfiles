# Marcin's dotfiles

The dotfiles are managed using [chezmoi](https://www.chezmoi.io/).

## Getting started

Check out the [Quick Start](https://www.chezmoi.io/quick-start/) page.

### Install chezmoi and the dotfiles on any new machine

With a single command:

```sh
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply marcin-freitag
```

### Update

On any machine, you can pull and apply the latest changes from your repo with:

```sh
chezmoi update -v
```
