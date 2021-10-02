#!/bin/sh
echo "Install inital packages"
sudo dnf install -y 
git \
curl \
terraform \
python3-pip \
zsh \
util-linux-user

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

curl -Lo ~/.local/share/fonts/MesloLGS\ NF\ Regular.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf

curl -Lo ~/.p10k.zsh https://raw.githubusercontent.com/mmagalha-uva/zsh-init/main/.p10k.zsh

curl -Lo ~/.zshrc https://raw.githubusercontent.com/mmagalha-uva/zsh-init/main/.zshrc

sudo chsh -s /usr/bin/zsh $USERNAME

