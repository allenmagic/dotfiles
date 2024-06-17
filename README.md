# 简介
本脚本依据gh0stzk创建的适用于Arch Linux的bspwm安装和配置的脚本修改而来，本脚本适合于安装Debian 12系统。原脚本中用于Archlinux的命令和功能已经修改成适用于Debian 12的对应的命令和功能。

# 功能修改
- 删除了NeoVIM的配置和修改，因为Debian 12默认的NeoVIM版本比较低，如果有需要采用脚本中的NeoVIM配置的需求，可以手动安装版本高于9.0的NeoVIM后再复制config中的nvim配置文件
- 添加了zplug作为zsh的插件管理工具
- 添加了netselect-apt工具，可以用来管理apt的源
- 添加了fcitx的配置文件和theme，适用于需要安装中文输入法的用户
- 添加了一些Archlinux默认的壁纸，Debian用户可以自行删除后再添加Debian的系统默认壁纸
- 分拆了字体安装，可以后面的字体安装部分

# 安装
在\~目录下git clone repo后将debianinstaller复制到\~目录下
```bash
    git clone --depth=1 https://github.com/allenmagic/dotfiles.git 
    cd dotfiles
    cp DebianInstaller ~
    cd ~
```

安装
```bash
    chmod +x DebianInstaller
    bash DebianInstaller
```

# 字体
本脚本的字体相关安装内容拆分到另一个脚本中执行，但在本脚本中进行了font的git clone操作。目前字体部分git clone到/home/$USER/.local/share/fonts。在脚本执行完成后可以执行以下操作
```bash
    cd ~/.local/share/fonts
    chmod +x install
    ./install
```