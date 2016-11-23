sudo apt-get update
sudo apt-get install -y tmux git vim ssh openssh-server tree htop

echo "
alias apti='sudo apt-get install'
alias aptd='sudo apt-get update'
alias aptg='sudo apt-get upgrade'

alias venv='source venv/bin/activate'
" >> ~/.bashrc

git config --global fetch.recurseSubmodules true
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.br branch
git config --global color.ui true
git config --global color.status auto
git config --global color.branch auto
git config --global color.diff true
