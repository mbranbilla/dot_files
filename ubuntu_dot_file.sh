#!/bin/sh

# Update to get the latest packafe lists
apt update -y && apt upgrade -y

# Turning OS to portuguese
apt install mythes-pt-pt mythes-pt-br thunderbird-locale-pt-pt thunderbird-locale-pt-br hunspell-pt-pt hunspell-pt-br hyphen-pt-pt hyphen-pt-br -y

# Optimize battery
apt install tlp tlp-rdw -y
systemctl enable tlp && tlp start

# Add Flatpaks
apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
snap install snapd -y
snap install core -y

apt install gnome-software-plugin-flatpak -y

# Install codecs
apt install ubuntu-restricted-extras -y

# Install VLC Player
apt install vlc -y

# Install Spotify
snap install spotify -y

# Install Google Chrome
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list

cd /tmp && wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && cd ..

apt update -y && apt install google-chrome-stable -y

# Install Slack
flatpak install flathub com.slack.Slack -y

# Install Python and packages
apt install software-properties-common -y
add-apt-repository ppa:deadsnakes/ppa -y
apt update -y
apt install python3 -y

python3 -m pip install --upgrade pip setuptools wheel
python3 -m pip install --upgrade pip numpy pandas scikit-learn matplotlib seaborn imbalanced-learn
python3 -m pip install --upgrade pip jupyter jupyterlab ipython ipykernel

apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget -y

# R Software
apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common -y
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 -y
add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/' -y

apt install r-base -y

# R Studio
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-2022.02.1-461-amd64.deb
dpkg -i rstudio-2022.02.1-461-amd64.deb


# Some utils stufs
apt install curl -y

apt install arc arj cabextract lhasa p7zip p7zip-full p7zip-rar rar unrar unace unzip xz-utils zip -y

apt install gdebi -y

apt install stacer -y

apt install gparted -y
