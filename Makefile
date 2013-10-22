prefix = $(HOME)/local

all: emacs tmux config

test:
	echo $(prefix)

emacs:
	(cd software &&\
	wget http://ftpmirror.gnu.org/emacs/emacs-24.3.tar.gz &&\
	tar zxvf emacs-24.3.tar.gz &&\
	cd emacs-24.3 && ./configure --prefix="$(prefix)" --with-xpm=no --with-gif=no && make -j4 && make install)

tmux:
	sh tmux_local_install.sh

config:
	git clone https://github.com/cedricporter/vim-emacs-setting.git


