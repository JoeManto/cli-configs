cp ~/.vimrc .vimrc
cp ~/.tmux.conf .tmux.conf
cp ~/.zshrc .zshrc
cp ~/.gitconfig .gitconfig

rm -r .config
cp -r ~/.config .config
