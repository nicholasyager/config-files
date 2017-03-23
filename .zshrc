autoload zkbd
function zkbd_file() {
    [[ -f ~/.zkbd/${TERM}-${VENDOR}-${OSTYPE} ]] && printf '%s' ~/".zkbd/${TERM}-${VENDOR}-${OSTYPE}" && return 0
    [[ -f ~/.zkbd/${TERM}-${DISPLAY}          ]] && printf '%s' ~/".zkbd/${TERM}-${DISPLAY}"          && return 0
    return 1
}


[[ ! -d ~/.zkbd ]] && mkdir ~/.zkbd
keyfile=$(zkbd_file)
ret=$?
if [[ ${ret} -ne 0 ]]; then
    zkbd
    keyfile=$(zkbd_file)
    ret=$?
fi
if [[ ${ret} -eq 0 ]] ; then
    source "${keyfile}"
else
    printf 'Failed to setup keys using zkbd.\n'
fi
unfunction zkbd_file; unset keyfile ret

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}" up-line-or-history
[[ -n "${key[PageDown]}"   ]]  && bindkey  "${key[PageDown]}" down-line-or-history

alias ls='ls --color=auto'                                                      
export PATH=$PATH:~/.gem/ruby/2.2.0/bin                                         
export EDITOR=vim   

eval $(dircolors /home/nicholas/badwolf.dircolors)

autoload -U colors && colors

PROMPT="%{$fg[blue]%}%n%{$reset_color%} %# "
RPROMPT="%F{blue}%1~%f"

autoload -U promptinit
promptinit

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/.local/bin # Add local python to PATH
PATH=$PATH:$HOME/.cargo/bin

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nicholas/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export GOCODE="$HOME/gocode"
export PATH="$PATH:$HOME/.rvm/bin:${GOPATH//://bin:}/bin" # Add RVM to PATH for scripting
