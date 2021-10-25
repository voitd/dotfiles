#!/bin/sh

# Sync dotfiles repo and ensure that dotfiles are tangled correctly afterward

GREEN='\033[1;32m'
BLUE='\033[1;34m'
RED='\033[1;30m'
NC='\033[0m'

# Navigate to the directory of this script (generally ~/.dotfiles/.bin)
cd $(dirname $(readlink -f $0))
cd ..

echo -e "${BLUE}Stashing existing changes...${NC}"
stash_result=$(git stash push -m "sync-dotfiles: Before syncing dotfiles")
needs_pop=1
if [ "$stash_result" = "No local changes to save" ]; then
    needs_pop=0
fi

echo -e "${BLUE}Pulling updates from dotfiles repo...${NC}"
echo
git pull origin master
echo

if [[ $needs_pop -eq 1 ]]; then
    echo -e "${BLUE}Popping stashed changes...${NC}"
    echo
    git stash pop
fi

unmerged_files=$(git diff --name-only --diff-filter=U)
if [[ ! -z $unmerged_files ]]; then
   echo -e "${RED}The following files have merge conflicts after popping the stash:${NC}"
   echo
   printf %"s\n" $unmerged_files  # Ensure newlines are printed
else
   # Run stow to ensure all new dotfiles are linked
   stow .
fi
