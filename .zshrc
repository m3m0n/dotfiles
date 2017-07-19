#Check if antigen is on system, otherwise download it
[ -f ~/.antigen/antigen.zsh ] ||  curl -fLo ~/.antigen/antigen.zsh --create-dirs git.io/antigen

#Source antigen and aliases
source ~/.antigen/antigen.zsh
source ~/.zsh_aliases

#Load Oh My ZSH library
antigen use oh-my-zsh

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

#Theme
antigen theme bira

#Oh-My-ZSH Plugins
antigen bundle colored-man-pages
antigen bundle git
antigen bundle colorize
antigen bundle cp
antigen bundle vi-mode

#Other Plugins
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

#Apply antigen options
antigen apply

#Set vim as default editor
export EDITOR='vim'

#Run neofetch
if [ -f /usr/bin/neofetch ]; then neofetch; fi

#Script to test color capabilities of terminal
awk 'BEGIN{
s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
for (colnum = 0; colnum<77; colnum++) {
    r = 255-(colnum*255/76);
    g = (colnum*510/76);
    b = (colnum*255/76);
    if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
}'

