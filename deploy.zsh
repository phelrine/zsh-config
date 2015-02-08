#!/bin/zsh
BASE_DIR=$(cd $(dirname $0); pwd)
ANTIGEN_HOME="${HOME}/.antigen"
ZPREZTO_HOME="${HOME}/.zprezto"

if [ ! -e ${ANTIGEN_HOME} ]; then
    echo "Installing antigen"
    git clone https://github.com/zsh-users/antigen.git ${ANTIGEN_HOME}
fi
source ${ANTIGEN_HOME}/antigen.zsh

echo "Installing prezto"
antigen bundle sorin-ionescu/prezto
ln -snf ${ANTIGEN_HOME}/repos/.zprezto ${ZPREZTO_HOME}
ln -sf ${BASE_DIR}/zprezto ${HOME}/.zpreztorc
for rcfile in "${ZPREZTO_HOME}"/runcoms/{zlogin,zprofile,zshenv,zshrc}; do
    ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
