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

if [ ! -f ${HOME}/.zsh ]; then
    mkdir .zsh
fi

PS3="Do you use p10k theme?"
select ans in yes no end
if [ $ans = "yes" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
    ln -s ${PWD}/p10k.zsh ${HOME}/.zsh/p10k.zsh
fi

echo "complete"
