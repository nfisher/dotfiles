ln -sf `pwd`/_bash_profile ~/.bash_profile
if [ -L ~/.vim ]; then
	rm ~/.vim
fi
ln -sf `pwd`/_vim ~/.vim
ln -sf `pwd`/_vimrc ~/.vimrc
ln -sf `pwd`/_gitconfig ~/.gitconfig
