# Arch WSL config

## Setup

### 1. Get the repo

```bash
git clone https://github.com/obsqrbtz/wsldots.git ~/dotfiles
cd ~/dotfiles

### 2. Modify credentials in `.gitconfig` if needed

### 3. Place ssh keys to `~/.ssh` if set in `.gitconfig`

### 4. Run install script

```
chmod+x ./setup.sh
./setup.sh
```

## Unlink config files

```bash
stow -D -v -t ~ .
```
