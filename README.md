<<<<<<< HEAD
# 说明
本脚本来自于gh0stzk的RiceInstaller脚本，该脚本适用于Archlinux User一键式安装bspwm窗口管理器和其附带的组件（包括sxhkd、polybar等等），并提供了多套不同的Rice主题，有兴趣的Archlinuxer可以看一看。

本脚本针对Debian做了一些修改，修改的内容如下：
- 删除了lightdm和lightdm-gtk-greeter等组件，因此初次安装的朋友可能需要通过在tty下输入startx等方式开始使用bspwm，如果提前安装了display manager则不用关心
- 删除了安装Neovim，目前Debian上的nvim版本较低不太合适安装lazyvim，所以建议朋友们手动安装nvim及其管理器等工具
- 删除了不能通过apt安装的一些字体，脚本里提供了通过github repo方式安装一些特定需要的字体
- 删除了zsh的一些插件安装，修改了.zshrc使用zplug管理插件
- 增加了安装figlet和lolcat工具，可以在执行脚本时显示当前的用户欢迎Logo
- 添加了netselect-apt工具，可以使用该工具更新source.list文件以选择最快的仓库源
- 配置文件修改
  - ploybar配置文件中将Arch的logo替换为Debian的Logo
  - 将默认的empty text修改为Debian linux

# 使用方法
## Debian安装

```bash
git clone --depth=1 https://github.com/allenmagic/dotfiles.git
cd dotfiles
chmod +x DebianInstaller
/.DebianInstaller
```

## Arch安装

```bash
git clone --depth=1 https://github.com/allenmagic/dotfiles.git
cd dotfiles
chmod +x RiceInstaller
/.RiceInstaller
=======
# BSPWM themes | A complete bspwm environment


> [!CAUTION]
> ⚠️⚠️⚠️ This dotfiles are configured at **1600x900** resolution with **96** DPI and **1** monitor.
> Some stuff might break on lower or higher resolutions, but still work!! ⚠️⚠️⚠️

<br>


## 🎨 The themes

| :tshirt: Theme Selector |
|:-:|
|![Screenshot-11_12_2023-01-06-03](https://github.com/gh0stzk/dotfiles/assets/67278339/b11b5c58-b9ec-446b-8980-4f77bebb3432)|

| :traffic_light: Wallpaper Selector |
|:-:|
|![Screenshot-11_12_2023-01-03-00](https://github.com/gh0stzk/dotfiles/assets/67278339/0746df0f-6a56-44d6-a899-7bdbc0f1a593)|

### 🌸Emilia:

|<img src="https://user-images.githubusercontent.com/67278339/280174054-8f56d12d-4efa-4024-99e1-4679591b45ca.gif" alt="Emilia Rice" align="center">|
|---|

<details>
<summary><b>Extra wallpapers in Emilia</b></summary>

|<img src="config/bspwm/rices/emilia/walls/wall-02.webp" alt="Emilia Rice" align="center" width="150px">|<img src="config/bspwm/rices/emilia/walls/wall-03.webp" alt="Emilia Rice" align="center" width="150px">|<img src="config/bspwm/rices/emilia/walls/wall-04.webp" alt="Emilia Rice" align="center" width="150px">|
|:-:|:-:|:-:|
|<img src="config/bspwm/rices/emilia/walls/wall-05.webp" alt="Emilia Rice" align="center" width="150px">|<img src="config/bspwm/rices/emilia/walls/wall-06.webp" alt="Emilia Rice" align="center" width="150px">|<img src="config/bspwm/rices/emilia/walls/wall-07.webp" alt="Emilia Rice" align="center" width="150px">|

</details>

### 🌸Jan

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/6e4959b7-6d07-42c6-8ede-2f3c16094ad2" alt="Jan Rice" align="center">|
|---|

<details>
<summary><b>Extra wallpapers in Jan</b></summary>

|<img src="config/bspwm/rices/jan/walls/wall-01.webp" alt="Jan Rice" align="center" width="150px">|<img src="config/bspwm/rices/jan/walls/wall-02.webp" alt="Jan Rice" align="center" width="150px">|<img src="config/bspwm/rices/jan/walls/wall-03.webp" alt="Jan Rice" align="center" width="150px">|
|:-:|:-:|:-:|
|<img src="config/bspwm/rices/jan/walls/wall-04.webp" alt="Jan Rice" align="center" width="150px">|<img src="config/bspwm/rices/jan/walls/wall-05.webp" alt="Jan Rice" align="center" width="150px">|<img src="config/bspwm/rices/jan/walls/wall-07.webp" alt="Jan Rice" align="center" width="150px">|

</details>

### 🌸Aline

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/5ae48d8d-ebcb-4fd5-9c80-78fc325a7a38" alt="Aline Rice" align="center">|
|---|

<details>
<summary><b>Extra wallpapers in Aline</b></summary>

|<img src="config/bspwm/rices/aline/walls/wall-02.webp" alt="Aline Rice" align="center" width="150px">|<img src="config/bspwm/rices/aline/walls/wall-03.webp" alt="Aline Rice" align="center" width="150px">|<img src="config/bspwm/rices/aline/walls/wall-04.webp" alt="Aline Rice" align="center" width="150px">|
|:-:|:-:|:-:|
|<img src="config/bspwm/rices/aline/walls/wall-05.webp" alt="Aline Rice" align="center" width="150px">|<img src="config/bspwm/rices/aline/walls/wall-06.webp" alt="Aline Rice" align="center" width="150px">|<img src="config/bspwm/rices/aline/walls/wall-07.webp" alt="Aline Rice" align="center" width="150px">|

</details>

### 🌸Andrea

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/1bfd302f-0e3f-4973-975b-56c78d6140ee" alt="Andrea Rice" align="center">|
|---|

<details>
<summary><b>Extra wallpapers in Andrea</b></summary>

|<img src="config/bspwm/rices/andrea/walls/wall-02.webp" alt="Andrea Rice" align="center" width="150px">|<img src="config/bspwm/rices/andrea/walls/wall-03.webp" alt="Andrea Rice" align="center" width="150px">|<img src="config/bspwm/rices/andrea/walls/wall-04.webp" alt="Andrea Rice" align="center" width="150px">
|:-:|:-:|:-:|
|<img src="config/bspwm/rices/andrea/walls/wall-05.webp" alt="Andrea Rice" align="center" width="150px">|

</details>

### 🌸Cynthia

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/5df45139-1d73-4f5f-8e8d-a417c86bfb96" alt="Cynthia Rice" align="center">|
|---|

<details>
<summary><b>Extra wallpapers in Cynthia</b></summary>

|<img src="config/bspwm/rices/cynthia/walls/wall-01.webp" alt="Cynthia Rice" align="center" width="150px">|<img src="config/bspwm/rices/cynthia/walls/wall-02.webp" alt="Cynthia Rice" align="center" width="150px">|<img src="config/bspwm/rices/cynthia/walls/wall-04.webp" alt="Cynthia Rice" align="center" width="150px">|
|:-:|:-:|:-:|
<img src="config/bspwm/rices/cynthia/walls/wall-05.webp" alt="Cynthia Rice" align="center" width="150px">|<img src="config/bspwm/rices/cynthia/walls/wall-06.webp" alt="Cynthia Rice" align="center" width="150px">|<img src="config/bspwm/rices/cynthia/walls/wall-07.webp" alt="Cynthia Rice" align="center" width="150px">|

</details>

### 🌸Isabel

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/f2a0002f-3370-4361-9301-08abadcad600" alt="Isabel Rice" align="center">|
|---|

<details>
<summary><b>Extra wallpapers in Isabel</b></summary>

|<img src="config/bspwm/rices/isabel/walls/wall-02.webp" alt="Isabel Rice" align="center" width="150px">|<img src="config/bspwm/rices/isabel/walls/wall-03.webp" alt="Isabel Rice" align="center" width="150px">|<img src="config/bspwm/rices/isabel/walls/wall-04.webp" alt="Isabel Rice" align="center" width="150px">|
|:-:|:-:|:-:|
<img src="config/bspwm/rices/isabel/walls/wall-05.webp" alt="Isabel Rice" align="center" width="150px">|<img src="config/bspwm/rices/isabel/walls/wall-06.webp" alt="Isabel Rice" align="center" width="150px">|<img src="config/bspwm/rices/isabel/walls/wall-07.webp" alt="Isabel Rice" align="center" width="150px">|

</details>

### 🌸Silvia

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/616c2d93-fabf-41c2-9ab8-9c7b4d6a2e35" alt="Silvia Rice" align="center">|
|---|

<details>
<summary><b>Extra wallpapers in Silvia</b></summary>

|<img src="config/bspwm/rices/silvia/walls/wall-01.webp" alt="Silvia Rice" align="center" width="150px">|<img src="config/bspwm/rices/silvia/walls/wall-03.webp" alt="Silvia Rice" align="center" width="150px">|<img src="config/bspwm/rices/silvia/walls/wall-04.webp" alt="Silvia Rice" align="center" width="150px">|
|:-:|:-:|:-:|
<img src="config/bspwm/rices/silvia/walls/wall-05.webp" alt="Silvia Rice" align="center" width="150px">|<img src="config/bspwm/rices/silvia/walls/wall-06.webp" alt="Silvia Rice" align="center" width="150px">|<img src="config/bspwm/rices/silvia/walls/wall-07.webp" alt="Silvia Rice" align="center" width="150px">|

</details>

### 🌸Melissa

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/a63e250d-c5d1-4360-afd7-cf64bf55a0fc" alt="Melissa Rice" align="center">|
|---|

<details>
<summary><b>Extra wallpapers in Melissa</b></summary>

|<img src="config/bspwm/rices/melissa/walls/wall-02.webp" alt="Melissa Rice" align="center" width="150px">|<img src="config/bspwm/rices/melissa/walls/wall-03.webp" alt="Melissa Rice" align="center" width="150px">|<img src="config/bspwm/rices/melissa/walls/wall-04.webp" alt="Melissa Rice" align="center" width="150px">|
|:-:|:-:|:-:|
<img src="config/bspwm/rices/melissa/walls/wall-05.webp" alt="Melissa Rice" align="center" width="150px">|<img src="config/bspwm/rices/melissa/walls/wall-06.webp" alt="Melissa Rice" align="center" width="150px">|<img src="config/bspwm/rices/melissa/walls/wall-07.webp" alt="Melissa Rice" align="center" width="150px">|

</details>

### 🌸Pamela

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/f9e85839-53c9-4e15-a800-8a2f7ca40691" alt="Pamela Rice" align="center">|
|---|

<details>
<summary><b>Extra wallpapers in Pamela</b></summary>

|<img src="config/bspwm/rices/pamela/walls/wall-02.webp" alt="Pamela Rice" align="center" width="150px">|<img src="config/bspwm/rices/pamela/walls/wall-03.webp" alt="Pamela Rice" align="center" width="150px">|<img src="config/bspwm/rices/pamela/walls/wall-04.webp" alt="Pamela Rice" align="center" width="150px">|
|:-:|:-:|:-:|
|<img src="config/bspwm/rices/pamela/walls/wall-05.webp" alt="Pamela Rice" align="center" width="150px">|<img src="config/bspwm/rices/pamela/walls/wall-06.webp" alt="Pamela Rice" align="center" width="150px">|<img src="config/bspwm/rices/pamela/walls/wall-07.webp" alt="Pamela Rice" align="center" width="150px">|

</details>

### 🌸Cristina

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/e14c6777-25f6-4621-a88b-4fda71dbcc7f" alt="Cristina Rice" align="center">|
|---|

<details>
<summary><b>Extra wallpapers in Cristina</b></summary>

|<img src="config/bspwm/rices/cristina/walls/wall-02.webp" alt="Cristina Rice" align="center" width="150px">|<img src="config/bspwm/rices/cristina/walls/wall-03.webp" alt="Cristina Rice" align="center" width="150px">|<img src="config/bspwm/rices/cristina/walls/wall-04.webp" alt="Cristina Rice" align="center" width="150px">|
|:-:|:-:|:-:|
<img src="config/bspwm/rices/cristina/walls/wall-05.webp" alt="Cristina Rice" align="center" width="150px">|<img src="config/bspwm/rices/cristina/walls/wall-06.webp" alt="Cristina Rice" align="center" width="150px">|<img src="config/bspwm/rices/cristina/walls/wall-07.webp" alt="Cristina Rice" align="center" width="150px">|

</details>

### 🌸Karla
**(Zombie-Night Color Scheme)**
|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/5455afdf-cc2f-4a8c-8fcd-526c59066d50" alt="Karla Rice" align="center">|
|---|

<details>
<summary><b>Extra wallpapers in Karla</b></summary>

|<img src="config/bspwm/rices/karla/walls/wall-02.webp" alt="Karla Rice" align="center" width="150px">|<img src="config/bspwm/rices/karla/walls/wall-03.webp" alt="Karla Rice" align="center" width="150px">|<img src="config/bspwm/rices/karla/walls/wall-04.webp" alt="Karla Rice" align="center" width="150px">|
|:-:|:-:|:-:|
<img src="config/bspwm/rices/karla/walls/wall-05.webp" alt="Karla Rice" align="center" width="150px">|<img src="config/bspwm/rices/karla/walls/wall-06.webp" alt="Karla Rice" align="center" width="150px">|<img src="config/bspwm/rices/karla/walls/wall-07.webp" alt="Karla Rice" align="center" width="150px">|
<img src="config/bspwm/rices/karla/walls/wall-08.webp" alt="Karla Rice" align="center" width="150px">|

</details>

### 🌸z0mbi3:

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/ff65caa8-6a15-4873-bf05-edf89ac0985d" alt="z0mbi3 Rice" align="center">|
|---|

<details>
<summary><b>Extra wallpapers in z0mbi3</b></summary>

|<img src="config/bspwm/rices/z0mbi3/walls/wall-01.webp" alt="z0mbi3 Rice" align="center" width="150px">|<img src="config/bspwm/rices/z0mbi3/walls/wall-02.webp" alt="z0mbi3 Rice" align="center" width="150px">|<img src="config/bspwm/rices/z0mbi3/walls/wall-03.webp" alt="z0mbi3 Rice" align="center" width="150px">|
|:-:|:-:|:-:|
<img src="config/bspwm/rices/z0mbi3/walls/wall-04.webp" alt="z0mbi3 Rice" align="center" width="150px">|<img src="config/bspwm/rices/z0mbi3/walls/wall-06.webp" alt="z0mbi3 Rice" align="center" width="150px">|<img src="config/bspwm/rices/z0mbi3/walls/wall-07.webp" alt="z0mbi3 Rice" align="center" width="150px">|

</details>

### 🌸Brenda:

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/22e37944-5aad-46bf-8934-3a57d1718ed2" alt="Brenda Rice" align="center">|
|---|

<details>
<summary><b>Extra wallpapers in Brenda</b></summary>

|<img src="config/bspwm/rices/brenda/walls/wall-01.webp" alt="Brenda Rice" align="center" width="150px">|<img src="config/bspwm/rices/brenda/walls/wall-02.webp" alt="Brenda Rice" align="center" width="150px">|<img src="config/bspwm/rices/brenda/walls/wall-04.webp" alt="Brenda Rice" align="center" width="150px">|
|:-:|:-:|:-:|
<img src="config/bspwm/rices/brenda/walls/wall-05.webp" alt="Brenda Rice" align="center" width="150px">|<img src="config/bspwm/rices/brenda/walls/wall-06.webp" alt="Brenda Rice" align="center" width="150px">|<img src="config/bspwm/rices/brenda/walls/wall-07.webp" alt="Brenda Rice" align="center" width="150px">|

</details>

### 🌸Daniela:

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/f296d6b4-9c8a-49ae-bf63-d82e5105f122" alt="Daniela Rice" align="center">|
|---|

<details>
<summary><b>Extra wallpapers in Daniela</b></summary>

|<img src="config/bspwm/rices/daniela/walls/wall-01.webp" alt="Daniela Rice" align="center" width="150px">|<img src="config/bspwm/rices/daniela/walls/wall-03.webp" alt="Daniela Rice" align="center" width="150px">|<img src="config/bspwm/rices/daniela/walls/wall-04.webp" alt="Daniela Rice" align="center" width="150px">|
|:-:|:-:|:-:|
<img src="config/bspwm/rices/daniela/walls/wall-05.webp" alt="Daniela Rice" align="center" width="150px">|<img src="config/bspwm/rices/daniela/walls/wall-06.webp" alt="Daniela Rice" align="center" width="150px">|<img src="config/bspwm/rices/daniela/walls/wall-07.webp" alt="Daniela Rice" align="center" width="150px">|

</details>

### 🌸Marisol:

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/d11d20c5-1edc-44c8-901b-a4103a139617" alt="Daniela Rice" align="center">|
|---|

<details>
<summary><b>Extra wallpapers in Marisol</b></summary>

|<img src="config/bspwm/rices/marisol/walls/wall-01.webp" alt="Marisol Rice" align="center" width="150px">|<img src="config/bspwm/rices/marisol/walls/wall-02.webp" alt="Marisol Rice" align="center" width="150px">|<img src="config/bspwm/rices/marisol/walls/wall-03.webp" alt="Marisol Rice" align="center" width="150px">|
|:-:|:-:|:-:|
<img src="config/bspwm/rices/marisol/walls/wall-05.webp" alt="Marisol Rice" align="center" width="150px">|<img src="config/bspwm/rices/marisol/walls/wall-06.webp" alt="Marisol Rice" align="center" width="150px">|<img src="config/bspwm/rices/marisol/walls/wall-07.webp" alt="Marisol Rice" align="center" width="150px">|

</details>

## Firefox Theme (z0mbi3 Fox)

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/9b956d3d-fc7b-49ca-b27f-dc6aa83d9e2f" alt="Firefox theme - z0mbi3-Fox" width="700">|
|:-:|
Complementarily you can install [this extension](https://github.com/PonyLucky/gh0stzk-Firefox/tree/master/extension) made by [PonyLucky](https://github.com/PonyLucky). It is a startpage to enhance UX. [Preview and configuration options](https://github.com/PonyLucky/gh0stzk-Firefox/tree/master/extension). Looks awesome with the firefox theme.

## Neovim Setup

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/17a1eb30-437e-4bf2-980c-6a410eff76bb" alt="Neovim configuration" width="700">|
|:-:|
Plugins included [Neovim setup wiki](https://github.com/gh0stzk/dotfiles/wiki/Neovim-setup)

## Very useful keybindigs to know...

| Keys | Action |
|:-|:-|
|<kbd>super</kbd> + <kbd>Enter</kbd><br><kbd>super</kbd> + <kbd>alt</kbd> + <kbd>Enter</kbd>| Open a terminal<br>Open a floating terminal.
|<kbd>alt</kbd> + <kbd>@space</kbd>| Display menu to select a theme.
|<kbd>super</kbd> + <kbd>@space</kbd>| Apps Menu.
|<kbd>super</kbd> + <kbd>alt</kbd> + <kbd>w</kbd>| Opens a menu to select a wallpaper.
|<kbd>super</kbd> + <kbd>h</kbd><br><kbd>super</kbd> + <kbd>u</kbd>|Hides bar/s<br>unhide bar/s
|<kbd>Print</kbd>| Takes screenshot.
|<kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>[plus,minus,t]</kbd>| Changes transparency on focused window.
|<kbd>ctrl</kbd> + <kbd>super</kbd> + <kbd>alt</kbd> + <kbd>p</kbd><br><kbd>ctrl</kbd> + <kbd>super</kbd> + <kbd>alt</kbd> + <kbd>r</kbd><br><kbd>ctrl</kbd> + <kbd>super</kbd> + <kbd>alt</kbd> + <kbd>k| Power off computer<br>Restart computer<br>Brute kill a window/process
|<kbd>super</kbd> + <kbd>alt</kbd> + <kbd>r</kbd>| Restart bspwm.

And more.. You need to look sxhkdrc file for more.

## 📦 setup

### 💾 Installation:
The installer only works for **ARCH** Linux, and based distros.

<b>Open a terminal in HOME</b>
- **First download the installer**
```sh
curl https://raw.githubusercontent.com/gh0stzk/dotfiles/master/RiceInstaller -o $HOME/RiceInstaller

# Maybe you want a short url??

curl -L https://is.gd/gh0stzk_dotfiles -o $HOME/RiceInstaller
```
- **Now give it execute permissions**
```sh
chmod +x RiceInstaller
```
- **Finally run the installer**
```sh
./RiceInstaller
>>>>>>> c2db682 (Initial commit)
```
