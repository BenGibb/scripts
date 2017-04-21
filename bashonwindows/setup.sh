pushd ~/
mkdir .vim
mkdir .vim/colors
pushd .vim/colors
curl -O https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim
popd -2

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp .vimrc ~
cp .tmux.conf ~
cp .bashrc ~

apt-get install mc

curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.256dark > ~/.dircolors 
