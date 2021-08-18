echo "REMOVE START"

# Remove all files from root that contains 'FILE_NAME' in file name(include filename extension, ignore cases)
sudo find / -iname "*FILE_NAME*" -depth -exec rm -rf {} \;

sudo find / -name ".DS_Store" -depth -exec rm {} \; # Remove all '.DS_store' files from root

rm -rf ~/.zsh_sessions/*
cat /dev/null > ~/.zsh_history
rm -rf ~/.vim/save/swap-dir/*
rm -rf ~/.vim/save/backup-dir/*
rm -rf ~/.vim/save/undo-dir/*
pbcopy < /dev/null

echo "REMOVE FINISH"
