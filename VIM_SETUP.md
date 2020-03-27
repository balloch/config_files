# Configure VIM

How I configure my Vim on a new machine

*Note:* This may get merged with the main README but its currently seperate because its more of a living doc and the README is more static

High level--I work in regular Vim 8+ with the in-built Pathogen-like build path manager and a script called `install.sh` (in this dir) that lives in `$HOME/.vim/path`. 
It helps my shit function a little more like Vundle. See [Cameron's blog post](https://stories.abletech.nz/get-rid-of-your-vim-plugin-manager-7c8ff742f643#.abnjauzgk) and [corresponding git repo](https://github.com/camfowler/vim) for more details. 
The most important plugins are:
  * [YouCompleteMe](#youcompleteme)

## [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe):
This is for linux. See the linked Gihub for other OS. Lots of steps. Ready your breakfast and eat hearty.

### Pre-install
```
sudo apt update
apt install build-essential cmake vim python3-dev
```
#### install [Mono](https://linuxize.com/post/how-to-install-mono-on-ubuntu-18-04/):
Mono is a required platform for developing and running cross-platform applications based on the ECMA/ISO Standards
```
sudo apt install dirmngr gnupg apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
sudo sh -c 'echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" > /etc/apt/sources.list.d/mono-official-stable.list'
sudo apt update
sudo apt install mono-complete 
```
Verify the installation by typing the following command which will print the Mono version:
`mono --version`
#### install [Go](https://github.com/golang/go/wiki/Ubuntu):
This is a PPA, not the official install
```
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go
```
#### install (NVM and) NPM and Node if you haven't already:
Option 1 (apt is easy):
`sudo apt install npm`
Option 2 (slower, more robust), Install [NVM](https://github.com/nvm-sh/nvm): 
`curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
add the following line to `.bashrc` or `.zshrc` and then source it:
```
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```
test installation: 
`command -v nvm`
Use it to install node and npm:
`nvm install node # or 6.14.4, 8.9.1, etc`


