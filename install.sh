 #!/usr/bin/env bash
#  ██████╗ ██╗ ██████╗███████╗    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗
#  ██╔══██╗██║██╔════╝██╔════╝    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
#  ██████╔╝██║██║     █████╗      ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
#  ██╔══██╗██║██║     ██╔══╝      ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
#  ██║  ██║██║╚██████╗███████╗    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
#  ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
#   Script to install gh0stzk's bspwm dotfile for Debian distro
#   Author: allenmagic 
#   url: https://github.com/allenmagic
#   Date: 2024-06-01
#   Comment: due to lower version NeoVIM on Debian so I delete the neovim configuration,
#   you can install it mannually and download config files from github as you want.

CRE=$(tput setaf 1)
CYE=$(tput setaf 3)
CGR=$(tput setaf 2)
CBL=$(tput setaf 4)
BLD=$(tput bold)
CNC=$(tput sgr0)

backup_folder=~/.RiceBackup
date=$(date +%Y%m%d-%H%M%S)

########## ---------- Check the figlet to display LOGO  ---------- ##########

is_installed() {
    dpkg -l "$1" &> /dev/null
}

for logo_tool in figlet lolcat; do
    if ! is_installed "$logo_tool"; then
        sudo apt install -y "$logo_tool"  >/dev/null 2>> RiceError.log
        exit 1
    fi
done

logo () {
figlet -f big -m 2 -w 200 "Hello, $USER" | lolcat
}

########## ---------- You must not run this as root ---------- ##########

if [ "$(id -u)" = 0 ]; then
    echo "This script MUST NOT be run as root user."
    exit 1
fi

home_dir=$HOME
current_dir=$(pwd)

if [ "$current_dir" != "$home_dir" ]; then
    printf "%s%sThe script must be executed from the HOME directory.%s\n" "${BLD}" "${CYE}" "${CNC}"
    exit 1
fi

########## ---------- Welcome ---------- ##########

logo "Welcome!"
printf '%s%sThis script will check if you have the necessary dependencies, and if not, it will install them. Then, it will clone my repository in your HOME directory.\n\n After that, it will create a backup of your files, and then copy the new files to your computer.\n\n My dotfiles DO NOT modify any of your system configurations.\n\n You will be prompted for your root password to install missing dependencies and/or to switch to zsh shell if its not your default.\n\n This script doesnt have the potential power to break your system, it only copies files from my repository to your HOME directory.\n\n Yes, this notification is not modified and I copy it from z0mbi3, thanks to his hard work on it.%s\n\n' "${BLD}" "${CRE}" "${CNC}"

while true; do
    read -rp " Do you wish to continue? [y/N]: " yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) exit;;
            * ) printf " Error: just write 'y' or 'n'\n\n";;
        esac
    done
clear

########## ---------- Install packages ---------- ##########

logo "Installing needed packages.."

# Some packages without apt installation
# 'zsh-history-substring-search'

dependencias=(build-essential cargo alacritty brightnessctl bspwm dunst feh firefox git kitty imagemagick jq jgmenu \
        libwebp7 lsd maim mpc mpd ncmpcpp npm pamixer papirus-icon-theme physlock picom playerctl polybar \
        policykit-1-gnome python3-gi ranger redshift rofi sxhkd tmux fonts-inconsolata fonts-jetbrains-mono \
        webp-pixbuf-loader xclip xdg-user-dirs x11-xserver-utils xdo xdotool x11-utils zsh wget netselect-apt \
        ueberzug xorg lightdm lightdm-gtk-greeter fcitx5 fcitx5-chinese-addons)

printf "%s%sChecking for required packages...%s\n" "${BLD}" "${CBL}" "${CNC}"
for paquete in "${dependencias[@]}"; do
    if ! is_installed "$paquete"; then
        if sudo apt install -y "$paquete"  >/dev/null 2>> RiceError.log; then
            printf "%s%s%s %shas been installed succesfully.%s\n" "${BLD}" "${CYE}" "$paquete" "${CBL}" "${CNC}"
            sleep 1
        else
            printf "%s%s%s %shas not been installed correctly. See %sRiceError.log %sfor more details.%s\n" "${BLD}" "${CYE}" "$paquete" "${CRE}" "${CBL}" "${CRE}" "${CNC}"
            sleep 1
        fi
    else
        printf '%s%s%s %sis already installed on your system!%s\n' "${BLD}" "${CYE}" "$paquete" "${CGR}" "${CNC}"
        sleep 1
    fi
done
sleep 5
clear

########## ---------- Preparing Folders ---------- ##########

# Verifies if the archive user-dirs.dirs doesn't exist in ~/.config
if [ ! -e "$HOME/.config/user-dirs.dirs" ]; then
    xdg-user-dirs-update
fi

sleep 2
clear


########## ---------- Backup files ---------- ##########

logo "Backup files"

printf "If you already have a powerful and super Pro NEOVIM configuration, write 'n' in the next question. If you answer 'y' your neovim configuration will be moved to the backup directory.\n\n"

while true; do
    read -rp "Do you want to try my nvim config? (y/n): " try_nvim
    if [[ "$try_nvim" == "y" || "$try_nvim" == "n" ]]; then
        break
    else
        echo "Invalid input. Please enter 'y' or 'n'."
    fi
done

printf "\nBackup files will be stored in %s%s%s/.RiceBackup%s \n\n" "${BLD}" "${CRE}" "$HOME" "${CNC}"
sleep 10

[ ! -d "$backup_folder" ] && mkdir -p "$backup_folder"

for folder in bspwm alacritty picom rofi eww sxhkd dunst kitty polybar geany gtk-3.0 ncmpcpp ranger tmux zsh mpd paru; do
    if [ -d "$HOME/.config/$folder" ]; then
        if mv "$HOME/.config/$folder" "$backup_folder/${folder}_$date" 2>> RiceError.log; then
            printf "%s%s%s folder backed up successfully at %s%s/%s_%s%s\n" "${BLD}" "${CGR}" "$folder" "${CBL}" "$backup_folder" "$folder" "$date" "${CNC}"
            sleep 1
        else
            printf "%s%sFailed to backup %s folder. See %sRiceError.log%s\n" "${BLD}" "${CRE}" "$folder" "${CBL}" "${CNC}"
            sleep 1
        fi
    else
        printf "%s%s%s folder does not exist, %sno backup needed%s\n" "${BLD}" "${CGR}" "$folder" "${CYE}" "${CNC}"
        sleep 1
    fi
done

if [[ $try_nvim == "y" ]]; then
        # Backup nvim
    if [ -d "$HOME/.config/nvim" ]; then
        if mv "$HOME/.config/nvim" "$backup_folder/nvim_$date" 2>> RiceError.log; then
                printf "%s%snvim folder backed up successfully at %s%s/nvim_%s%s\n" "${BLD}" "${CGR}" "${CBL}" "$backup_folder" "$date" "${CNC}"
                sleep 1
            else
                printf "%s%sFailed to backup nvim folder. See %sRiceError.log%s\n" "${BLD}" "${CRE}" "${CBL}" "${CNC}"
                sleep 1
        fi
        else
            printf "%s%snvim folder does not exist, %sno backup needed%s\n" "${BLD}" "${CGR}" "${CYE}" "${CNC}"
            sleep 1
    fi
fi

for folder in "$HOME"/.mozilla/firefox/*.default-release/chrome; do
    if [ -d "$folder" ]; then
        if mv "$folder" "$backup_folder"/chrome_"$date" 2>> RiceError.log; then
            printf "%s%sChrome folder backed up successfully at %s%s/chrome_%s%s\n" "${BLD}" "${CGR}" "${CBL}" "$backup_folder" "${date}" "${CNC}"
        else
            printf "%s%sFailed to backup Chrome folder. See %sRiceError.log%s\n" "${BLD}" "${CRE}" "${CBL}" "${CNC}"
        fi
    else
        printf "%s%sThe folder Chrome does not exist, %sno backup needed%s\n" "${BLD}" "${CGR}" "${CYE}" "${CNC}"
    fi
done

for file in "$HOME"/.mozilla/firefox/*.default-release/user.js; do
    if [ -f "$file" ]; then
        if mv "$file" "$backup_folder"/user.js_"$date" 2>> RiceError.log; then
            printf "%s%suser.js file backed up successfully at %s%s/user.js_%s%s\n" "${BLD}" "${CGR}" "${CBL}" "$backup_folder" "${date}" "${CNC}"
        else
            printf "%s%sFailed to backup user.js file. See %sRiceError.log%s\n" "${BLD}" "${CRE}" "${CBL}" "${CNC}"
        fi
    else
        printf "%s%sThe file user.js does not exist, %sno backup needed%s\n" "${BLD}" "${CGR}" "${CYE}" "${CNC}"
    fi
done

if [ -f ~/.zshrc ]; then
    if mv ~/.zshrc "$backup_folder"/.zshrc_"$date" 2>> RiceError.log; then
        printf "%s%s.zshrc file backed up successfully at %s%s/.zshrc_%s%s\n" "${BLD}" "${CGR}" "${CBL}" "$backup_folder" "${date}" "${CNC}"
    else
        printf "%s%sFailed to backup .zshrc file. See %sRiceError.log%s\n" "${BLD}" "${CRE}" "${CBL}" "${CNC}"
    fi
else
    printf "%s%sThe file .zshrc does not exist, %sno backup needed%s\n" "${BLD}" "${CGR}" "${CYE}" "${CNC}"
fi

if [ -f ~/.gtkrc-2.0 ]; then
    if mv ~/.gtkrc-2.0 "$backup_folder"/.gtkrc-2.0_"$date" 2>> RiceError.log; then
        printf "%s%s.gtkrc-2.0 file backed up successfully at %s%s/.gtkrc-2.0_%s%s\n" "${BLD}" "${CGR}" "${CBL}" "$backup_folder" "${date}" "${CNC}"
    else
        printf "%s%sFailed to backup .gtkrc-2.0 file. See %sRiceError.log%s\n" "${BLD}" "${CRE}" "${CBL}" "${CNC}"
    fi
else
    printf "%s%sThe file .gtkrc-2.0 does not exist, %sno backup needed%s\n" "${BLD}" "${CGR}" "${CYE}" "${CNC}"
fi

if [ -d ~/.icons ]; then
    if mv ~/.icons "$backup_folder"/.icons"$date" 2>> RiceError.log; then
        printf "%s%s.icons folder backed up successfully at %s%s/.icons_%s%s\n" "${BLD}" "${CGR}" "${CBL}" "$backup_folder" "${date}" "${CNC}"
    else
        printf "%s%sFailed to backup .icons folder. See %sRiceError.log%s\n" "${BLD}" "${CRE}" "${CBL}" "${CNC}"
    fi
else
    printf "%s%sThe .icons folder does not exist, %sno backup needed%s\n" "${BLD}" "${CGR}" "${CYE}" "${CNC}"
fi

printf "%s%sDone!!%s\n\n" "${BLD}" "${CGR}" "${CNC}"
sleep 5


########## ---------- Copy the Rice! ---------- ##########

logo "Installing dotfiles.."
printf "Copying files to respective directories..\n"

[ ! -d ~/.config ] && mkdir -p ~/.config
[ ! -d ~/.local/bin ] && mkdir -p ~/.local/bin
[ ! -d ~/.local/share ] && mkdir -p ~/.local/share

for dirs in ~/dotfiles/config/*; do
    dir_name=$(basename "$dirs")
# If the directory is nvim and the user doesn't want to try it, skip this loop
    if [[ $dir_name == "nvim" && $try_nvim != "y" ]]; then
        continue
    fi
    if cp -R "${dirs}" ~/.config/ 2>> RiceError.log; then
        printf "%s%s%s %sconfiguration installed succesfully%s\n" "${BLD}" "${CYE}" "${dir_name}" "${CGR}" "${CNC}"
        sleep 1
    else
        printf "%s%s%s %sconfiguration failed to been installed, see %sRiceError.log %sfor more details.%s\n" "${BLD}" "${CYE}" "${dir_name}" "${CRE}" "${CBL}" "${CRE}" "${CNC}"
        sleep 1
    fi
done

for folder in applications asciiart fonts startup-page; do
    if cp -R ~/dotfiles/misc/$folder ~/.local/share/ 2>> RiceError.log; then
        printf "%s%s%s %sfolder copied succesfully!%s\n" "${BLD}" "${CYE}" "$folder" "${CGR}" "${CNC}"
        sleep 1
    else
        printf "%s%s%s %sfolder failed to been copied, see %sRiceError.log %sfor more details.%s\n" "${BLD}" "${CYE}" "$folder" "${CRE}" "${CBL}" "${CRE}" "${CNC}"
        sleep 1
    fi
done

if cp -R ~/dotfiles/misc/bin ~/.local/ 2>> RiceError.log; then
    printf "%s%sbin %sfolder copied succesfully!%s\n" "${BLD}" "${CYE}" "${CGR}" "${CNC}"
    sleep 1
else
    printf "%s%sbin %sfolder failed to been copied, see %sRiceError.log %sfor more details.%s\n" "${BLD}" "${CYE}" "${CRE}" "${CBL}" "${CRE}" "${CNC}"
    sleep 1
fi

if cp -R ~/dotfiles/misc/firefox/* ~/.mozilla/firefox/*.default-release/ 2>> RiceError.log; then
    printf "%s%sFirefox theme %scopied succesfully!%s\n" "${BLD}" "${CYE}" "${CGR}" "${CNC}"
    sleep 1
else
    printf "%s%sFirefox theme %sfailed to been copied, see %sRiceError.log %sfor more details.%s\n" "${BLD}" "${CYE}" "${CRE}" "${CBL}" "${CRE}" "${CNC}"
    sleep 1
fi


if cp -R ~/dotfiles/home/.icons "$HOME" 2>> RiceError.log; then
    printf "%s%s.icons folder %scopied succesfully!%s\n" "${BLD}" "${CYE}" "${CGR}" "${CNC}"
    sleep 1
else
    printf "%s%s.icons folder %sfailed to been copied, see %sRiceError.log %sfor more details.%s\n" "${BLD}" "${CYE}" "${CRE}" "${CBL}" "${CRE}" "${CNC}"
    sleep 1
fi


sed -i "s/user_pref(\"browser.startup.homepage\", \"file:\/\/\/home\/z0mbi3\/.local\/share\/startup-page\/index.html\")/user_pref(\"browser.startup.homepage\", \"file:\/\/\/home\/$USER\/.local\/share\/startup-page\/index.html\")/" "$HOME"/.mozilla/firefox/*.default-release/user.js
sed -i "s/name: 'gh0stzk'/name: '$USER'/" "$HOME"/.local/share/startup-page/config.js
cp -f "$HOME"/dotfiles/home/.zshrc "$HOME"
cp -f "$HOME"/dotfiles/home/.gtkrc-2.0 "$HOME"
fc-cache -rv >/dev/null 2>&1

printf "\n\n%s%sFiles copied succesfully!!%s\n" "${BLD}" "${CGR}" "${CNC}"
sleep 5


########## ---------- Installing Eww & others ---------- ##########

logo "installing Eww, tdrop & xqp"

# Intalling tdrop for scratchpads
    if command -v tdrop >/dev/null 2>&1; then
        printf "\n%s%sTdrop is already installed%s\n" "${BLD}" "${CGR}" "${CNC}"
    else
        printf "\n%s%sInstalling tdrop, this should be fast!%s\n" "${BLD}" "${CBL}" "${CNC}"
        {
            cd "$HOME" || exit
            git clone --depth=1 https://github.com/noctuid/tdrop.git
            cd tdrop || exit
            sudo make install
        } && {
            cd "$HOME" || exit
        } 
    fi


# Installing Eww 
    if command -v eww >/dev/null 2>&1; then 
        printf "\n%s%sEww is already installed%s\n" "${BLD}" "${CGR}" "${CNC}"
    else
        printf "\n%s%sInstalling Eww, it will be fast.%s\n" "${BLD}" "${CBL}" "${CNC}"
        {
            cd ~/dotfiles/packages || exit
            chmod +x eww
            echo "Installing eww..."
                if sudo install -Dm755 eww /usr/bin/eww; then
                    echo "Installation complete."
                else
                    echo "Error: Something happend."
                fi
        } && {
            cd "$HOME" || exit
        } || {
        printf "\n%s%sFailed to install stalonetray. You may need to install it manually%s\n" "${BLD}" "${CRE}" "${CNC}"
    }
fi


# Installing xqp
    if command -v xqp >/dev/null 2>&1; then 
        printf "\n%s%sxqp is already installed%s\n" "${BLD}" "${CGR}" "${CNC}"
    else
        printf "\n%s%sInstalling xqp, this should be fast!%s\n" "${BLD}" "${CBL}" "${CNC}"
        {
            cd "$HOME" || exit
            git clone --depth=1 https://github.com/baskerville/xqp.git
            cd xqp || exit
            make && sudo make install
        } && {
            cd "$HOME" || exit
        } || {
        printf "\n%s%sFailed to install xqp. You may need to install it manually%s\n" "${BLD}" "${CRE}" "${CNC}"
    }
fi



# Installing stalonetray and clear the installation folder
    if command -v stalonetray >/dev/null 2>&1; then 
        printf "\n%s%sstalonetray is already installed%s\n" "${BLD}" "${CGR}" "${CNC}"
    else
        printf "\n%s%sInstalling stalonetray, this could take 10 mins or more.%s\n" "${BLD}" "${CBL}" "${CNC}"
        {
            cd ~/dotfiles/packages/ || exit
            sudo dpkg -i stalonetray_0.8.3-1_amd64.deb
        } && {
            cd "$HOME" || exit
        } || {
        printf "\n%s%sFailed to install stalonetray. You may need to install it manually%s\n" "${BLD}" "${CRE}" "${CNC}"
    }
fi


########## ---------- Installing needed fonts ---------- ##########

logo "installing fonts"

fonts_repo_url="https://github.com/allenmagic/fonts"
fonts_dir="$HOME/.local/share/fonts"

if [ ! -e "$fonts_dir" ]; then
    printf "Make the fonts dir\n"
    mkdir -p "$fonts_dir"
fi

# Clone the repository
printf "Cloning fonts from %s\n" "$fonts_repo_url"
git clone --depth=1 "$fonts_repo_url" "$fonts_dir" 

sleep 2
sudo fc-cache -f -v
clear


########## ---------- Enabling MPD service ---------- ##########

logo "Enabling mpd service"

# Verifica si el servicio mpd está habilitado a nivel global (sistema)
if systemctl is-enabled --quiet mpd.service; then
    printf "\n%s%sDisabling and stopping the global mpd service%s\n" "${BLD}" "${CBL}" "${CNC}"
    sudo systemctl stop mpd.service
    sudo systemctl disable mpd.service
fi

printf "\n%s%sEnabling and starting the user-level mpd service%s\n" "${BLD}" "${CYE}" "${CNC}"
systemctl --user enable --now mpd.service

printf "%s%sDone!!%s\n\n" "${BLD}" "${CGR}" "${CNC}"
sleep 2

systemctl enable lightdm

########## --------- Changing shell to zsh ---------- ##########

logo "Changing default shell to zsh"

if [[ $SHELL != "/usr/bin/zsh" ]]; then
    printf "\n%s%sChanging your shell to zsh. Your root password is needed.%s\n\n" "${BLD}" "${CYE}" "${CNC}"
    # Cambia la shell a zsh
    chsh -s /usr/bin/zsh
    printf "%s%sShell changed to zsh. Please reboot.%s\n\n" "${BLD}" "${CGR}" "${CNC}"
else
    printf "%s%sYour shell is already zsh\nGood bye! installation finished, now reboot%s\n" "${BLD}" "${CGR}" "${CNC}"
fi
zsh
