# System Aliases
alias cls='clear'
alias log='journalctl -f'
alias top='htop'
alias f='fuck'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF --color=auto'
alias ls='ls -al --color=auto'

# Aliases for editing files
alias z='source ~/.bashrc'
alias add='nano ~/.bash_aliases'
alias lxdm='sudo nano /etc/lxdm/lxdm.conf'
alias rc='nano ~/.bashrc'
alias refind='sudo nano /boot/efi/EFI/refind/refind.conf'

# Aliases for i3/modifying config files
alias i='nano ~/.config/i3/config'
alias top='nano ~/dotfiles/i3/bar/top.conf'
alias bottom='nano ~/dotfiles/i3/bar/bottom.conf'

# Arch-specific aliases
alias pac='sudo pacman -Syu --noconfirm'
alias rem='sudo pacman -Rs'
alias update='sudo pacman -Syyu --noconfirm'
alias color='sh ~/dotfiles/scripts/terminal-colors/colors.sh'

# Navigation aliases
alias dot='cd ~/dotfiles'
alias efi='cd /boot/efi/EFI/refind/themes'

# Terminal prompt
export PS1="\[\e[35m\]\t\[\e[m\] \[\e[32m\]\u\[\e[m\]@\[\e[36m\][\[\e[m\]\[\e[36m\]\w\[\e[m\]\[\e[36m\]]\[\e[m\]\[\e[37m\]:\[\e[m\] "

# Misc
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|#tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$>

