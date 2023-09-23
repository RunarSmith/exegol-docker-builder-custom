#!/bin/bash

# set an apt cache for Debian familly
function set_apt_cacher() {
    
    if [ -f /usr/bin/apt ]; then
        echo "Setting-up apt-cacher-ng for Debian client"
        cat <<EOF >> /etc/hosts
172.17.0.2    aptcacher.loc
EOF

        cat <<EOF > /etc/apt/apt.conf.d/01-aptcacheng
Acquire::http::Proxy "http://aptcacher.loc:3142";
EOF

    fi
}


function set_locale()  {
    # ensure proper locale for system
    [ -f /etc/locale.gen ] && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
}

function install_python_virtualenv() {
    # for Debian-like OS
    [ -f /usr/bin/apt ] && apt update -yq && apt install -yq python3 python3-virtualenv

    # For arch-linux-like OS
    # sync database, update installed packages, ans install new ones
    [ -f /usr/bin/pacman ] && pacman -Syu --noconfirm python3 python-virtualenv
}

function install_ansible() {
    # install a removable ansible installation
    python3 -m virtualenv /tmp/venv-ansible -p python3
    . /tmp/venv-ansible/bin/activate
    # install ansible python modules in virtualenv
    pip install ansible
}

function test_ansible() {
    export LC_ALL=C.UTF-8
    ansible localhost -m ping
}

function execute_ansible() {
    [ "x$VIRTUAL_ENV" == "x" ] && . /tmp/venv-ansible/bin/activate
    # Ansible want this locale ...
    export LC_ALL=C.UTF-8
    # install dependencies (collections)
    ansible-galaxy install -r requirements.yml
    # display command line for debug
    echo "ansible-playbook -i inventory.yml $*"
    # go go go !!
    ansible-playbook -i inventory.yml $*
}

if [ $# -eq 0 ]
  then
    # first call without parameter : install and setup
    echo "No arguments supplied : install the base"
    set_apt_cacher
    #set_locale
    install_python_virtualenv
    install_ansible
    test_ansible
  else
    # call with a parameter : execute the playbook (parameter)
    execute_ansible $*
fi