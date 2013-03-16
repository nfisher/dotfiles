if [ -L ~/.vim ]; then
	rm ~/.vim
fi


ln -sf `pwd`/_bash_profile ~/.bash_profile
ln -sf `pwd`/_vim ~/.vim
ln -sf `pwd`/_vimrc ~/.vimrc
ln -sf `pwd`/_gitconfig ~/.gitconfig
ln -sf `pwd`/_autotest ~/.autotest
ln -sf `pwd`/_zshrc ~/.zshrc
ln -sf `pwd`/_gemrc ~/.gemrc
ln -sf `pwd`/_aliases ~/.aliases
ln -sf `pwd`/_irssi ~/.irssi
