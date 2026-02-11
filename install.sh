#! /bin/bash
DIR="${HOME}/.dotfiles_backup"
if [ ! -d "${DIR}" ]; then
   mkdir -p -m 700 "${DIR}"
fi

if [ -f "${HOME}/.zshrc" ]; then
    mv "${HOME}/.zshrc" "${DIR}"
fi
ln -sf "${PWD}/zshrc" "${HOME}/.zshrc"

if [ -f "${HOME}/.tmux.conf" ]; then
    mv "${HOME}/.tmux.conf" "${DIR}"
fi
ln -sf "${PWD}/tmux.conf" "${HOME}/.tmux.conf"

if [ -f "${HOME}/.vimrc" ]; then
    mv "${HOME}/.vimrc" "${DIR}"
fi
ln -sf "${PWD}/vimrc" "${HOME}/.vimrc"

if [ ! -d "${HOME}/.zsh" ]; then
    mkdir -p "${HOME}/.zsh"
fi

PS3="Do you use p10k theme?"
select ans in yes no end
do
    if [ "${ans}" = "yes" ]; then
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${HOME}/.zsh/powerlevel10k"
        ln -sf "${PWD}/p10k.zsh" "${HOME}/.zsh/p10k.zsh"
        break
    fi
    if [ "${ans}" = "no" ] || [ "${ans}" = "end" ]; then
        break
    fi
done

echo "complete"
