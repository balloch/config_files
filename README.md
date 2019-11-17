# configs
Different custom configuration files and new computer startup

## Prep
Install necessities

### 18.04
Mandatory:
```
sudo apt update
sudo apt install build-essential python-pip curl wget git xclip openssh-server zip unzip bc imagemagick libjpeg-turbo8-dev feh arandr arc-theme rofi 
```
possibly optional:
```
sudo apt install lxappearance gnome-tweak-tool libpam0g-dev libxcb-composite0 libxcb-composite0-dev libxcb-image0-dev libxcb-randr0 libxcb-util-dev libxcb-xinerama0 libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-x11-dev libev-dev
```


### 14.04 and 16.04 [OLD: no longer being updated]
```
sudo apt update
sudo apt install build-essential pip pip3 git curl wget xclip openssh-server
```

Do Docker separately
```
sudo apt install apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce
sudo apt update
```

`sudo usermod -aG docker $USER`
(You will need to log out after this step for docker to work)


## ZSH And Oh My ZSH

`sudo apt install zsh`

You may have to log out here. Then: 

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

Add .zshrc from this repo

Then change shell:

`chsh -s $(which zsh)`

To ensure that you don't have any errors with your syntax highlighting run: 

```
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```
### powerline fonts procedure:

`pip install --user git+git://github.com/Lokaltog/powerline`

modifying ~/.profile by  adding following lines at the end of it (already in the .profile here):

`if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi`

Install font:

```
cd
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
mkdir ~/.fonts #don't know if this is necessary, compat. for 16.04
cp /usr/share/fonts/PowerlineSymbols.otf ~/.fonts #don't know if this is necessary, compat. for 16.04
fc-cache -vf ~/.fonts #don't know if this is necessary, compat. for 16.04
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
```

```
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf ~/.fonts/
mkdir -p .config/fontconfig/conf.d
```

## SSH Setup
Make sure that users who are sudo should be
`usermod -aG sudo <user>`

**Now with the remote computers that you care about**
Check that the you have ssh keys in `/home/$USER/.ssh/`

If you don't have one run
`ssh-keygen`

Grab this thing, its good for your keeeeeys
`sudo apt install ssh-copy-id`

Then run it
`ssh-copy-id <user>@<server-id>`

**Now back on the new [remote] computer**
Now get rid of your password authentication and restart the server
`sudo vim /etc/ssh/sshd_config`
(set `PasswordAuthentication no`)
*IF 14.04*
`sudo /etc/init.d/ssh restart`
*IF 16.04 OR HIGHER*
`sudo systemctl restart ssh`

## i3 Setup
This is specifically for i3 setup stuff, but there are some previous sections that start to add things (like, example, `apt install i3`).

For [playerctl](https://packages.debian.org/buster/playerctl), which I am not entirely sure what it is necessary for/not for, but spotify is the focus:
```
wget http://ftp.nl.debian.org/debian/pool/main/p/playerctl/libplayerctl2_2.0.1-1_amd64.deb
wget http://ftp.nl.debian.org/debian/pool/main/p/playerctl/playerctl_2.0.1-1_amd64.deb
sudo dpkg -i libplayerctl2_2.0.1-1_amd64.deb playerctl_2.0.1-1_amd64.deb
```
Also can be built from [source](https://github.com/altdesktop/playerctl).


## Useful links:
https://gist.github.com/renshuki/3cf3de6e7f00fa7e744a
https://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04

