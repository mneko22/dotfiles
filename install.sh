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

if ! command -v starship >/dev/null 2>&1; then
    curl -fsSL https://starship.rs/install.sh | sh -s -- -y
fi

echo "complete"
