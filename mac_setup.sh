#! /bin/zsh
# sh mac_setup.sh

cat bash/.bashrc > ~/.bashrc
cat tmux/.tmux.conf > ~/.tmux.conf
cat vim/.ideavimrc > ~/.ideavimrc
cat vim/.vimrc > ~/.vimrc
mkdir -p ~/.vim/colors && cp vim/colors/*.vim ~/.vim/colors/
cat zsh/.zshrc > ~/.zshrc

mkdir -p ~/.vim/vimrc
cat vim/basic.vim > ~/.vim/vimrc/basic.vim
cat vim/filetypes.vim > ~/.vim/vimrc/filetypes.vim
cat vim/plugins_config.vim > ~/.vim/vimrc/plugins_config.vim
cat vim/statusline.vim > ~/.vim/vimrc/statusline.vim

mkdir -p ~/.config/zsh
cat zsh/aliases.zsh > ~/.config/zsh/aliases.zsh
cat zsh/completion.zsh > ~/.config/zsh/completion.zsh
cat zsh/functions.zsh > ~/.config/zsh/functions.zsh
cat zsh/git.plugin.zsh > ~/.config/zsh/git.plugin.zsh

cp -r misc ~/.config/
mkdir -p ~/proj/

cd ~/

echo "===== ===== ===== ===== ===== ===== ===== ===== ===== etc"
sh ~/.config/misc/userkeymapping.plist.sh

echo "===== ===== ===== ===== ===== ===== ===== ===== ===== Installing Xcode Command Line Tools"
xcode-select --install

echo "===== ===== ===== ===== ===== ===== ===== ===== ===== Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/home/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "===== ===== ===== ===== ===== ===== ===== ===== ===== Updating homebrew"
brew update

echo "===== ===== ===== ===== ===== ===== ===== ===== ===== Installing brew stuff"
brew install git
brew install zsh
brew install vim
brew install tmux
brew install gcc
brew install llvm
brew install zsh-completions
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install npm
brew install ctags
brew install openjdk
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

echo "===== ===== ===== ===== ===== ===== ===== ===== ===== Cleaning up brew"
brew cleanup

#echo "===== ===== ===== ===== ===== ===== ===== ===== ===== Installing npm stuff"
#npm install -g browser-sync
#npm install eslint --save-dev
#npm install -g eslint_d

echo "===== ===== ===== ===== ===== ===== ===== ===== ===== Setting correct permissions"
sudo chmod -R go-w "$(brew --prefix)/share"
# compaudit | xargs chmod g-w
# rm -f ~/.zcompdump && compinit

echo "===== ===== ===== ===== ===== ===== ===== ===== ===== Done!"
