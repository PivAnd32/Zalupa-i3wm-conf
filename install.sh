#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo '╭───────────────────────────────────────────────────╮'
echo '│ ███████╗ █████╗ ██╗     ██╗   ██╗██████╗  █████╗  │'
echo '│ ╚══███╔╝██╔══██╗██║     ██║   ██║██╔══██╗██╔══██╗ │'
echo '│   ███╔╝ ███████║██║     ██║   ██║██████╔╝███████║ │'
echo '│  ███╔╝  ██╔══██║██║     ██║   ██║██╔═══╝ ██╔══██║ │'
echo '│ ███████╗██║  ██║███████╗╚██████╔╝██║     ██║  ██║ │'
echo '│ ╚══════╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝ │'
echo '│   Automated Setup Script for Arch/Debian/Fedora   │'
echo '│                   Zalupa-v0.1                     │'
echo '╰───────────────────────────────────────────────────╯'
echo ""
read -p "Are you sure you want to install Zalupa? (y/N): " answer
answer_lower=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

if command -v i3 &> /dev/null; then
   echo " "
else
    echo 'sorry, but is this config only for i3-wm :('
    echo 'please downloading i3-wm or search another config'
    exit 1
fi
if [[ "$answer_lower" == "y" || "$answer_lower" == "yes" ]]; then
    detect_package_manager() {
        if command -v pacman &> /dev/null; then
            echo "pacman"
            return 0
        elif command -v apt &> /dev/null; then
            echo "apt"
            return 0
        elif command -v dnf &> /dev/null; then
            echo "dnf"
            return 0
        elif command -v yum &> /dev/null; then
            echo "yum"
            return 0
        else
            echo "unsupported"
            return 1
        fi
    }
    read -p "Install fish shell and set as default? (y/N): " answer
    answer_lower=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

    INSTALL_FISH=""
    if [[ "$answer_lower" == "y" || "$answer_lower" == "yes" ]]; then
        INSTALL_FISH="fish"
        echo "Fish will be installed and set as default shell."
    else
        echo "Fish will not be installed."
    fi

    PM=$(detect_package_manager)
    if [ $? -eq 0 ]; then
        echo "Detected package manager: $PM"
        case $PM in
            pacman)
                echo "Updating system and installing packages..."
                sudo pacman -Syu --noconfirm --needed git base-devel
                echo "Installing main packages: alacritty, picom, nemo, firefox, fastfetch, polybar, zed, feh, j4-dmenu-desktop $INSTALL_FISH "
                sudo pacman -S --noconfirm --needed alacritty picom nemo firefox fastfetch polybar feh j4-dmenu-desktop $INSTALL_FISH
                if command -v yay &> /dev/null; then
                    echo "yay (AUR helper) is already installed. Skipping..."
                else
                echo "Installing yay (AUR helper)..."
                cd /tmp
                git clone https://aur.archlinux.org/yay.git
                cd yay
                makepkg -si --noconfirm
                cd ~/
                fi
                ;;
            apt)
                echo "Updating system and installing packages..."
                sudo apt update && sudo apt upgrade
                echo "Installing main packages: alacritty, picom, nemo, firefox, fastfetch, polybar, zed, j4-dmenu-desktop, feh $INSTALL_FISH"
                sudo apt install -y alacritty picom nemo firefox polybar fastfetch zed feh j4-dmenu-desktop $INSTALL_FISH
                ;;
            dnf|yum)
                echo "Updating system and installing packages..."
                sudo $PM update -y
                echo "Installing main packages: alacritty, picom, nemo, firefox, fastfetch, polybar, zed, feh j4-dmenu-desktop $INSTALL_FISH"
                sudo $PM install -y alacritty picom nemo firefox polybar fastfetch zed feh j4-dmenu-desktop $INSTALL_FISH
                ;;
        esac
        if [[ -n "$INSTALL_FISH" ]]; then
                   echo "Changing default shell to fish..."
                   chsh -s /usr/bin/fish
                   cat $SCRIPT_DIR/idk/alacrittyF.toml > $SCRIPT_DIR/alacritty/alacritty.toml
                   echo "Default shell changed to fish."
                   echo "copy config fish"
                   cp -r $SCRIPT_DIR/fish/functions ~/.config/fish/
        fi

        echo "copy config alacritty..."
        cp -r $SCRIPT_DIR/alacritty ~/.config/
        cat $SCRIPT_DIR/idk/alacrittyB.toml > $SCRIPT_DIR/alacritty/alacritty.toml
        echo "copy config i3..."
        cp -r $SCRIPT_DIR/i3 ~/.config/
        echo "copy config picom..."
        cp -r $SCRIPT_DIR/picom ~/.config/
        echo "copy config polybar..."
        cp -r $SCRIPT_DIR/polybar ~/.config/
        echo "copy wallpaper..."
        cp -r $SCRIPT_DIR/wallpaper ~/
        echo "Installation completed!"
    else
        echo "Sorry, but system not supported."
        exit 1
    fi
elif [[ "$answer_lower" == "n" || "$answer_lower" == "no" || -z "$answer" ]]; then
    echo "Installation cancelled."
    exit 0
else
    echo "Please write Y or N."
    exit 1
fi
