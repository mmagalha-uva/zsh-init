#!/bin/sh

echo "Install inital packages"
{
    case $(lsb_release -si) in
    Ubuntu)
        apt install -y git curl python3-pip zsh util-linux-user ;;
} 2>&1 | tee /tmp/outputs.log

echo "Install zsh customizations"
{
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended 
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    curl -Lo ~/.local/share/fonts/MesloLGS_NF_Regular.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
    curl -Lo ~/.p10k.zsh https://raw.githubusercontent.com/mmagalha-uva/zsh-init/main/.p10k.zsh
    curl -Lo ~/.zshrc https://raw.githubusercontent.com/mmagalha-uva/zsh-init/main/.zshrc
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
    sudo chsh -s /usr/bin/zsh $USERNAME
} 2>&1 | tee /tmp/outputs.log

echo "Install custom packages"

echo "Install terraform"


