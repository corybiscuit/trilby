#!/bin/sh

clear

echo "████████████████████████████████████████████████████████████████████"
echo "█▌                                                                ▐█"
echo "█▌         █████           █████       ██████                     ▐█"
echo "█▌        ░░███           ░░███       ███░░███                    ▐█"
echo "█▌      ███████   ██████  ███████    ░███ ░░░  █████████████      ▐█"
echo "█▌     ███░░███  ███░░███░░░███░    ███████   ░░███░░███░░███     ▐█"
echo "█▌    ░███ ░███ ░███ ░███  ░███    ░░░███░     ░███ ░███ ░███     ▐█"
echo "█▌    ░███ ░███ ░███ ░███  ░███ ███  ░███      ░███ ░███ ░███     ▐█"
echo "█▌    ░░████████░░██████   ░░█████   █████     █████░███ █████    ▐█"
echo "█▌     ░░░░░░░░  ░░░░░░     ░░░░░   ░░░░░     ░░░░░ ░░░ ░░░░░     ▐█"
echo "█▌                                                                ▐█"
echo "████████████████████████████████████████████████████████████████████"
echo ""
echo Welcome $USER, what would you like to do today?
echo
echo "a) Add, push, and commit dotfiles"
echo "b) Update the dotfiles in ~/dotfiles"
echo "c) Edit your config files"
echo "q) Exit"

read answer

case $answer in

a) cd ~/dotfiles
   git add --all
   git commit
   git push
   clear
   exec sh "$0" "$@";;

b) rm ~/dotfiles/.zshrc
   cp -r ~/.zshrc ~/dotfiles/
   clear
   exec sh "$0" "$@";;

c) clear
   echo "What config would you like to edit?"
   echo "a) zsh"
   echo "q) Exit"
   read config
        case $config in
        a) nano ~/.zshrc && clear && exec sh "$0" "$@";;
        q) clear && exec "$0" "$@";;
        *) echo Not one of the choices && sleep 2 && clear && exec sh "$0" "$@";;
        esac
        ;;

q) clear && echo Goodbye!;;

*) echo Not one of the choices && sleep 2 && clear && exec sh "$0" "$@";;
esac