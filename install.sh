#! /bin/bash
DIR=${HOME}/.dotfiles_backup
if [ ! -d ${DIR} ]; then
   mkdir ${DIR}
fi

if [ -f ${HOME}/.zshrc ]; then
    mv ${HOME}/.zshrc ${DIR}
fi
ln -s ${PWD}/zshrc ${HOME}/.zshrc

if [ -f ${HOME}/.tmux.conf ]; then
    mv ${HOME}/.tmux.conf ${DIR}
fi
ln -s ${PWD}/tmux.conf ${HOME}/.tmux.conf

if [ -f ${HOME}/.vimrc ]; then
    mv ${HOME}/.vimrc ${DIR}
fi
ln -s ${PWD}/vimrc ${HOME}/.vimrc
