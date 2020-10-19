sudo -E apt update
sudo -E apt upgrade -y
sudo apt autoremove -y

sudo -E apt install vim tmux nethogs htop wget git -y

cd ~

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

curl -skL https://raw.githubusercontent.com/AceBee007/my_vimrc_file/master/.tmux.conf > ~/.tmux.conf

curl -skL https://raw.githubusercontent.com/AceBee007/my_vimrc_file/master/.vimrc > ~/.vimrc

curl -skL https://raw.githubusercontent.com/AceBee007/my_vimrc_file/master/.bash_aliases > ~/.bash_aliases
