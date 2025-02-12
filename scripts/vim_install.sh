#! /bin/bash

#install dependence
sudo apt update
sudo apt install git curl cmake build-essential -y

#vim compile dependence
sudo apt install libncurses5-dev libgtk2.0-dev libatk1.0-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev \
python3-dev ruby-dev lua5.2 liblua5.2-dev libperl-dev -y

#Install vim
git clone https://github.com/vim/vim.git
cd vim/
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=$(python3-config --configdir) \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local

make VIMRUNTIMEDIR=/usr/local/share/vim/vim91
sudo make install

cd ../

#install vundle and plugins

cp ./vimrc $HOME/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
sudo apt install fonts-powerline

#compile ycm
cd $HOME/.vim/bundle/youcompleteme
python3 install.py 
