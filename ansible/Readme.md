
# ^^'
# exegol s'assure que ce dossier est bien un dosser git ...
mv exegol-docker-build exegol-docker-build.old
cp -r exegol-docker-build.old/.git exegol-docker-build.old/


https://www.kali.org/tools/kali-meta/
https://www.kali.org/docs/general-use/metapackages/

- kali-linux-headless: Default install that doesn’t require GUI
    - kali-linux-core: Base Kali Linux System – core items that are always included
- kali-tools-web: Designed doing web applications attacks
- kali-tools-database: Based around any database attacks
- kali-tools-passwords: Helpful for password cracking attacks – Online & offline
- kali-tools-reporting: Reporting tools

- villain

kali-tools-windows-resources => in /exegol/resources

entrypoint + VPN



sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen

apt install python3-virtualenv
pacman -S python-virtualenv

python3 -m virtualenv .venv-ansible -p python3
. .venv-ansible/bin/activate
pip install ansible

export LC_ALL=C.UTF-8
ansible localhost -m ping
ansible localhost -m setup


        "ansible_distribution": "Kali",
        "ansible_distribution_file_parsed": true,
        "ansible_distribution_file_path": "/etc/os-release",
        "ansible_distribution_file_variety": "Debian",
        "ansible_distribution_major_version": "2023",
        "ansible_distribution_release": "kali-rolling",
        "ansible_distribution_version": "2023.3",
        "ansible_nodename": "exegol-mykali",
        "ansible_os_family": "Debian",
        "ansible_pkg_mgr": "apt",


        "ansible_distribution": "Archlinux",
        "ansible_distribution_file_path": "/etc/arch-release",
        "ansible_distribution_file_variety": "Archlinux",
        "ansible_distribution_major_version": "20230723",
        "ansible_distribution_release": "NA",
        "ansible_distribution_version": "20230723.0.166908",
        "ansible_nodename": "exegol-myarch",
        "ansible_os_family": "Archlinux",
        "ansible_pkg_mgr": "pacman",



DockerFile: indique le playbook à utiliser ( = tous les rôles à déployer)



exegol install blackarch
build locally: yes
profile = blackarch



/opt/exegol/Exegol/exegol-docker-build
exegol remove myarch2 ; exegol uninstall blackarch ; exegol install -vv blackarch blackarch
exegol start myarch2 blackarch
