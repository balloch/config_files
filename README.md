# configs
Different custom configuration files and new computer startup

WARNING: If in doubt, skip to CUDA Stuff first

## Prep
Install necessities

### 18.04
Mandatory:
```
sudo apt update
sudo apt install build-essential virtualenv curl wget git xclip openssh-server zip unzip bc imagemagick libjpeg-turbo8-dev ack ag feh arandr arc-theme rofi 
```
If you don't have pip (you should):
`sudo apt install python-pip python3-pip`

Then, go get [Miniconda](https://docs.conda.io/en/latest/miniconda.html), untar, and install:
`bash Miniconda3-latest-Linux-x86_64.sh`

optional, do not install until later when you know you need/want:
```
sudo apt install lxappearance gnome-tweak-tool libpam0g-dev libxcb-composite0 libxcb-composite0-dev libxcb-image0-dev libxcb-randr0 libxcb-util-dev libxcb-xinerama0 libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-x11-dev libev-dev
```

### 14.04 and 16.04 [OLD: no longer being updated]
```
sudo apt update
sudo apt install build-essential pip pip3 git curl wget xclip openssh-server
```

## NVidia and CUDA

**WARNING:** this is the Achilles Heal of this process. Expect it to go poorly. 

First, check what the current highest common CUDA version for both Tensorflow and Pytorch is. At the time of writing, it is (kinda) 10.0 with CuDNN 7. If compatible, [install the latest version of CUDA with a network DEB](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1804&target_type=deblocal), it will make everything easier. e.g. 10.2:
```
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb
sudo apt-key add /var/cuda-repo-10-2-local-10.2.89-440.33.01/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda
```

If the latest CUDA version is NOT compatible, install the [RUN version](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1804&target_type=runfilelocal). DEB has more compatibility issues:
```
wget http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_440.33.01_linux.run
sudo sh cuda_10.2.89_440.33.01_linux.run
```

Now restart your computer twice

## Docker (optional)
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

## Other Software:

Now go install the software in the Ubuntu Setup

## ZSH And Oh My ZSH

This guide for Windows, and frankly its more refined than my linux one here so its generally a good guide: https://medium.com/@ssharizal/hyper-js-oh-my-zsh-as-ubuntu-on-windows-wsl-terminal-8bf577cdbd97

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
Reference: [Alex Booker](https://github.com/bookercodes/setupi3) and his [v](https://www.youtube.com/watch?v=j1I63wGcvU4)i[d](https://www.youtube.com/watch?v=8-S0cWnLBKg)e[o](https://www.youtube.com/watch?v=ARKIwOlazKI)s
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

