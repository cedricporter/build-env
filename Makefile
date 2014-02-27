# Make by Hua Liang[Stupid ET]

prefix = $(HOME)/.local

all: emacs tmux config ohmyzsh pip

folder:
	mkdir -p $(prefix) software

test:
	echo $(prefix)

ncurses: folder
	(cd software && wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-5.9.tar.gz &&\
	tar xvzf ncurses-5.9.tar.gz && cd ncurses-5.9 &&\
	./configure --prefix=$(prefix) && make -j8 && make install)

emacs: folder ncurses
	(cd software &&\
	wget http://ftpmirror.gnu.org/emacs/emacs-24.3.tar.gz &&\
	tar zxvf emacs-24.3.tar.gz &&\
	cd emacs-24.3 && ./configure CFLAGS="-I$HOME/.local/include -I$HOME/.local/include/ncurses" LDFLAGS="-L$HOME/.local/lib -L$HOME/.local/include/ncurses -L$HOME/.local/include" --prefix="$(prefix)" --with-xpm=no --with-gif=no && make -j8 && make install)
	rehash

tmux:
	sh tmux_local_install.sh
	rehash

config:
	(cd $(HOME) && git clone https://github.com/cedricporter/vim-emacs-setting.git)

ohmyzsh:
	wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

python27:
	(cd software &&\
	wget http://www.python.org/ftp/python/2.7.5/Python-2.7.5.tgz &&\
	tar zxvf Python-2.7.5.tgz &&\
	cd Python-2.7.5 &&\
	./configure --prefix="$(prefix)" && make -j4 && make install)
	rehash

setuptools:
	(cd software &&\
	wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-1.1.6.tar.gz &&\
	tar zxvf setuptools-1.1.6.tar.gz &&\
	cd setuptools-1.1.6 &&\
	python setup.py install)
	rehash

pip: python27 setuptools
	(cd software &&\
	wget --no-check-certificate https://pypi.python.org/packages/source/p/pip/pip-1.4.1.tar.gz &&\
	tar zxvf pip-1.4.1.tar.gz &&\
	cd pip-1.4.1 &&\
	python setup.py install)
	rehash

trash-cli:
	pip install trash-cli
