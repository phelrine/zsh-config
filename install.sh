#/bin/sh
set -e
set -u

REPOSITORY_URL="https://github.com/phelrine/zsh-config.git"
ZSH_CONFIG_HOME=${HOME}/.zsh-config

if [ ! -e "$ZSH_CONFIG_HOME" ]; then
    git clone ${REPOSITORY_URL} ${ZSH_CONFIG_HOME}
fi

cd ${ZSH_CONFIG_HOME}
zsh deploy.zsh
