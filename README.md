# configs
Different custom configuration files and new computer startup

## Prep
Install necessities

`sudo apt install build-essential pip git curl wget xclip`

## ZSH And Oh My ZSH

`sudo apt install zsh`

You may have to log out here. Then: 

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

Add .zshrc from this repo

### powerline fonts procedure:

`pip install --user git+git://github.com/Lokaltog/powerline`

modifying ~/.profile by  adding following lines at the end of it (already in the .profile here):

`if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi`

Install font:

`wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/`

