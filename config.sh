sudo apt-get update
sudo apt-get install -y tmux git vim vim-gtk ssh openssh-server tree htop lnav curl

if [ $(cat ~/.bashrc | grep apti | wc -l) -eq 0 ]
then

echo "
SYNC_FOLDER= # Please update this in bashrc after setup

PATH=\$PATH:~/bin:\$SYNC_FOLDER/bin

# If linux-config folder does not exist and SYNC_FOLDER has been set, link folder
if [ ! -d ~/linux-config ] && [ "$SYNC_FOLDER" != \"\" ]; then
  ln -s \$SYNC_FOLDER ~/linux-config
  mv ~/.vimrc ~/.vimrc-old
  ln -s ~/linux-config/vimrc .vimrc
fi

alias apti='sudo apt-get install'
alias aptd='sudo apt-get update'
alias aptg='sudo apt-get upgrade'
alias sc='sudo supervisorctl'
alias venv='source \"\$(ls | grep venv -m 1)/bin/activate\"'

alias tmx='tmux -f ~/linux-config/tmux.conf'

" >> ~/.bashrc

fi

git config --global fetch.recurseSubmodules true
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.br branch
git config --global color.ui true
git config --global color.status auto
git config --global color.branch auto
git config --global color.diff true

cd ~
git clone https://github.com/yohtm/vim-config.git vim-config
mv ~/.vimrc ~/.vimrc.old
mv ~/.vim ~/.vim.old
ln -s $(readlink -f vim-config/vimrc) ~/.vimrc
ln -s $(readlink -f vim-config/vim) ~/.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall  +qall
