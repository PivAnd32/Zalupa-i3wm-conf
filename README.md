# Zalupa i3wm conf

**One-command i3wm setup for Arch, Debian and Fedora**

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Bash](https://img.shields.io/badge/shell-bash-4EAA25?logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Arch Linux](https://img.shields.io/badge/Arch-1793D1?logo=arch-linux&logoColor=white)](https://archlinux.org/)
[![Debian](https://img.shields.io/badge/Debian-D70A53?logo=debian&logoColor=white)](https://www.debian.org/)
[![Fedora](https://img.shields.io/badge/Fedora-51A2C4?logo=fedora&logoColor=white)](https://fedoraproject.org/)

---

## 📖 About

**Zalupa i3wm conf** is a fully automated setup script for users who want a ready-to-use i3wm environment. It detects your Linux distribution, installs required packages, and applies pre-configured dotfiles – all with **one command**.

## ✨ Features

- 🔍 Auto-detects package manager (`pacman` / `apt` / `dnf`)
- 📦 Installs: Alacritty, Picom, Nemo, Firefox, Polybar, Feh, Fish (optional)
- 🎨 Applies ready-to-use configs for i3wm and all tools
- 🐟 Optional Fish shell installation and set as default
- 🖼️ Copies default wallpaper
- ⚡ Works on Arch, Debian/Ubuntu and Fedora

## 🚀 Quick start

```bash
git clone https://github.com/PivAnd32/Zalupa-i3wm-conf.git
cd Zalupa-*/
chmod +x install.sh
./install.sh
```

## ⌨️ Default keybindings (i3wm)

| Keys | Action |
|--------------------|---------------------------|
| `$mod + Enter`     | Open terminal (Alacritty) |
| `$mod + q`         | Kill focused window       |
| `$mod + d`         | App launcher (dmenu)      |
| `$mod + f`         | Toggle fullscreen         |
| `$mod + s`         | Toggle floating mode      |
| `$mod + a`         | Focus parent container    |
| `$mod + e`         | Open file manager (Nemo)  |
| `$mod + z`         | Open Zed editor           |
| `$mod + c`         | Launch Discord            |
| `$mod + w`         | Launch Firefox            |
| `$mod + shift + r` | Restart i3-wm             |

> **Note:** `$mod` is usually the `Super` (Windows) key.

## 📦 What gets installed

| Tool        | Purpose                               |
|-------------|---------------------------------------|
| Alacritty   | GPU-accelerated terminal              |
| Picom       | Compositor (blur, fade)               |
| Nemo        | File manager                          |
| Firefox     | Web browser                           |
| Polybar     | Customizable status bar               |
| Feh         | Image viewer & wallpaper              |
| Zed         | Modern code editor                    |
| Fish        | Friendly interactive shell (optional) |


## 🔧 Post-install

After installation, config files are located in `~/.config/`:

- `~/.config/alacritty/alacritty.toml`
- `~/.config/i3/config`
- `~/.config/picom/picom.conf`
- `~/.config/polybar/config.ini`

Restart i3 (`$mod+Shift+R`) and enjoy.
