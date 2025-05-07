# Arch WSL config

## Setup

### 1. Get the repo

```bash
git clone https://github.com/obsqrbtz/wsldots.git ~/dotfiles
cd ~/dotfiles
```

### 2. Modify credentials in `.gitconfig` if needed

### 3. Place ssh keys to `~/.ssh` if set in `.gitconfig`

### 4. Run install script

```
chmod+x ./setup.sh
./setup.sh
```

### 5. Setup default user

In `/etc/wsl.conf`:

```
[user]
default=username
```

### 5. Enable WSLg

#### On Windows create `~/.wslconfig`:

```
[wsl2]
guiApplications = true
```

#### In WSL create `/etc/tmpfiles.d/wslg.conf`:

```
#      Path         Mode UID  GID  Age Argument
L+     %T/.X11-unix -    -    -    -   /mnt/wslg/.X11-unix
```

And `/etc/profile.d/wslg.sh`:

```bash
export GALLIUM_DRIVER=d3d12

for i in "/mnt/wslg/runtime-dir/"*; do
  [ "$XDG_RUNTIME_DIR" = "$HOME" ] && XDG_RUNTIME_DIR="/var/run/user/$UID"
  if [ ! -L "$XDG_RUNTIME_DIR$(basename "$i")" ]; then
    [ -d "$XDG_RUNTIME_DIR$(basename "$i")" ] && rm -r "$XDG_RUNTIME_DIR$(basename "$i")"
    ln -s "$i" "$XDG_RUNTIME_DIR$(basename "$i")"
  fi
done
```

#### After that in Windows run:

```powershell
wsl --terminate archlinux
```

#### On each WSL launch (already in `.zshrc`):

```bash
ln -s /mnt/wslg/runtime-dir/wayland-0* /run/user/1000/
```

**source**: [archwiki](https://wiki.archlinux.org/title/Install_Arch_Linux_on_WSL)

## Unlink config files

```bash
stow -D -v -t ~ .
```
