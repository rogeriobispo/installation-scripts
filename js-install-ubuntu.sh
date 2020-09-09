# install nvm node version manager

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# Running either of the above commands downloads a script and runs it. The script clones the nvm repository to ~/.nvm, and attempts to add the source lines from the snippet below to the correct profile file (~/.bash_profile, ~/.zshrc, ~/.profile, or ~/.bashrc).


# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# github https://github.com/nvm-sh/nvm

# Install yarn
# https://classic.yarnpkg.com/en/docs/install#debian-stable
# Instalar versão 1
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update && sudo apt install --no-install-recommends yarn


echo "Installs homyzsh"
sudo apt-get update
sudo apt-get install git-core zsh
sudo cp $(which zsh) /etc/shells
sudo usermod -s $(which zsh) $USER
wget --no-check-certificate http://install.ohmyz.sh -O - | sh
cp .zshrc ~
source .zshrc

echo "zinit"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

echo "Instarlar visual studio code"
echo "Instalar fonte fire code"
echo "Instalar extensôes"
echo "dracula"
echo "material icon theme"
echo "use setting json at this repo"

echo "spaceship prompt"
echo "https://github.com/denysdovhan/spaceship-prompt"

echo "tips terminal"
echo "https://blog.rocketseat.com.br/terminal-com-oh-my-zsh-spaceship-dracula-e-mais/"

echo "tips page bellow"
echo "https://blog.rocketseat.com.br/ambiente-desenvolvimento-javascript/"

echo "instalar o terminal hyper"
echo "https://hyper.is/#installation"

echo "All-language-auto-complete"
echo "TabNine"