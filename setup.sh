sudo -E apt update
sudo -E apt upgrade -y
sudo apt autoremove -y

sudo -E apt install vim tmux nethogs htop -y

cd ~

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

wget --no-check-certificate https://raw.githubusercontent.com/AceBee007/my_vimrc_file/master/.tmux.conf

wget --no-check-certificate https://raw.githubusercontent.com/AceBee007/my_vimrc_file/master/.vimrc

wget --no-check-certificate https://raw.githubusercontent.com/AceBee007/my_vimrc_file/master/.bash_aliases
