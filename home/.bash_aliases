alias i='nano ~/.config/i3/config'
alias z='source ~/.bashrc'
alias add='nano ~/.bash_aliases'
alias q='nano ~/.i3/config'
alias pac='sudo pacman -Sy'
alias note='nano ~/ArchNotes_3JUNE2019.txt'
alias top='nano ~/.i3/bar/top.conf'
alias bottom='nano ~/.i3/bar/bottom.conf'
alias update='sudo pacman -Syyu --no-confirm

### OLD ALIASES from 15 MARCH 2017 file added 11 JUNE 2019 ###

# Default aliases
alias ls='ls -al --color=auto'
alias ll='ls -al --color=auto'
alias cls='clear'

# Aliases to add/edit aliases file
alias add='sudo nano ~/.bash_aliases'
alias q='source ~/.bashrc'

# Arch aliases
alias pac='sudo pacman -S'
alias rem='sudo pacman -Rs'
alias update='sudo pacman -Syu'
alias lxdm='sudo nano /etc/lxdm/lxdm.conf'
alias log='journalctl -f'
alias rc='nano ~/.bashrc'

# i3-specific aliases
alias bar='nano ~/.i3/bar/i3bar.conf'
alias config='sudo nano ~/.i3/config'
alias i3='cd /home/radak/Dropbox/Projects/i3\ \&\ ArchLinux\ Files/'
alias color='sh ~/scripts/colors.sh'

# System aliases
#alias top='htop'
#alias ntp='sudo ntpd -qg' #enabled system service, shouldn't be needed anymore.
alias f='fuck'
# Terminal prompt
#export PS1="\[\e[35m\]\t\[\e[m\] \[\e[32m\]\u\[\e[m\]@\[\e[36m\][\[\e[m\]\[\e[36m\]\w\[\e[m\]\[\e[36m\]]\[\e[m\]\[\e[37m\]:\[\e[m\] "

# Program aliases
alias nano='sudo nano'

# Note to self, add alias for SSH connections, i.e. to website, to DDNS connections at home, to home server SSH, etc.
##############################################################################
# Aliases for Linux Mint/Ubuntu
#alias add='sudo nano ~/.bash_aliases'
#alias q='source ~/.bashrc'
#alias install='sudo apt-get install'
#alias clean='sudo apt-get autoclean && sudo apt-get autoremove'
#alias update='sudo apt-get update && sudo apt-get upgrade'
#alias router='ssh-keygen -f "/home/checkout/.ssh/known_hosts" -R 192.168.1.1'
#alias uninstall='sudo apt-get remove'
#alias log='tail -f /var/log/syslog'

# more aliases 3-15-2017
#alias add='nano ~/.bash_aliases'
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|#tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
#alias clean='sudo apt-get autoclean && sudo apt-get autoremove'
#alias dev='cd /home/kadar/Dropbox/1\ -\ JMU\ Fall\ 2016/ISAT345/dev/'
#alias efi='cd /boot/efi/EFI/refind/themes'
#alias egrep='egrep --color=auto'
#alias fgrep='fgrep --color=auto'
#alias grep='grep --color=auto'
#alias install='sudo apt-get install'
#alias l='ls -CF'
#alias la='ls -A'
#alias ll='ls -alF'
#alias log='tail -f /var/log/syslog'
#alias ls='ls --color=auto'
#alias q='source ~/.bashrc'
#alias refind='sudo nano /boot/efi/EFI/refind/refind.conf'
#alias rem='sudo apt-get remove'
#alias serv='ssh -p 2100 kadar@rockmyglock.asuscomm.com'
#alias update='sudo apt-get update'
#alias upgrade='sudo apt-get upgrade'
#alias web='ssh kadar@kadaranwar.com'



