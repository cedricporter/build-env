#!/bin/sh
#
# File: install.sh
#
# Created: 星期二, 十月 22 2013 by Hua Liang[Stupid ET] <et@everet.org>
#

mkdir software
cd software

# Emacs
if [ ! -f "emacs-24.3.tar.gz" ]; then
    wget http://ftpmirror.gnu.org/emacs/emacs-24.3.tar.gz
fi
tar zxvf emacs-24.3.tar.gz
(cd emacs-24.3 && ./configure --prefix=$HOME/local --with-xpm=no --with-gif=no && make -j4)
