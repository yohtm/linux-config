sudo apt-get update
sudo apt-get install -y tmux git vim ssh openssh-server tree htop

if [ $(cat ~/.bashrc | grep apti | wc -l) -eq 0 ]
then

echo "
alias apti='sudo apt-get install'
alias aptd='sudo apt-get update'
alias aptg='sudo apt-get upgrade'

alias venv='source venv/bin/activate'
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
