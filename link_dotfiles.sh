PWD={pwd}
ln -s "$(pwd)/.gitconfig" ~/
ln -s "$(pwd)/.gitignore_global" ~/
git config --global core.excludesfile ~/.gitignore_global
ln -s "$(pwd)/.vimrc" ~/ 
ln -s "$(pwd)/.zshrc" ~/
sudo ln -s "$(pwd)/tmux.conf" /etc/
