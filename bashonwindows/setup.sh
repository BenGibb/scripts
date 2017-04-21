pushd ~/
mkdir .vim
mkdir .vim/colors
pushd .vim/colors
curl -O https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim
popd -2

cp .vimrc ~
cp .tmux.conf ~
cp .bashrc ~

apt-get install mc

curl -O ~/.dircolors https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.256dark 
