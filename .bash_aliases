# Specify default editor. Possible values: vim, nano, ed etc.
export EDITOR=nvim

# display neofetch on terminal
# neofetch

# display fortune quote inside cowsay tux
# fortune | cowsay -f tux

# specfiy user in terminal - default case
export PS1="[\e[01;32m\]\u\e[m@\e[1;36m\h\e[m] \e[1;35m[\w]\e[m \n$ "

# starship terminal emulator
# eval "$(starship init bash)"

# my favourite oh-my-posh themes - uncomment to set
eval "$(oh-my-posh --init --shell bash --config ~/.poshthemes/kali.omp.json)"

# PATHS
export VERILATOR_ROOT=/home/usmansiddique/Tools/verilator/

# # ====================================================== Aliases
# add color support
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'

# display folders
alias ls='exa -GxF --icons --group-directories-first --color=auto'
alias ll='exa -alhF --icons --group-directories-first --color=auto'

# display tree
alias tree='tree -q --dirsfirst -C --sort name'

# display all mounted drives
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"

# count files in directory
alias count='find . -type f | wc -l'

# copy progress bar: cpy ./source ./destination
alias cpv='rsync -ah --info=progress2'

# change dir and view contents simultaneously
function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        ls
}