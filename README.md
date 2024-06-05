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
```
