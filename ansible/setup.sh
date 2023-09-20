cd /opt/exegol
git clone "https://github.com/ThePorgs/Exegol"
cd Exegol

git submodule update --recursive --remote

sudo ln -s "$(pwd)/exegol.py" "/usr/local/bin/exegol"
