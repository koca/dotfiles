# zmodload zsh/zprof

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:~/.composer/vendor/bin

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export SHELL=zsh

DISABLE_MAGIC_FUNCTIONS=true

# plugins=(git)

# source $ZSH/oh-my-zsh.sh

# check for antigen
if [[ ! -f ~/.antigen.zsh ]]; then
  curl -L git.io/antigen > ~/.antigen.zsh
fi
source ~/.antigen.zsh

# use oh-my-zsh library
antigen use oh-my-zsh

# install zsh plugins
# antigen bundle mafredri/zsh-async

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle jeffreytse/zsh-vi-mode # vim mode
antigen bundle zsh-users/zsh-history-substring-search

# tell antigen you're done
antigen apply


# load aliases
for file in $HOME/.aliases/* ; do
  source "$file"
done


# zstyle

# Complete . and .. special directories
zstyle ':completion:*' special-dirs true

# zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

if [[ $COMPLETION_WAITING_DOTS = true ]]; then
  expand-or-complete-with-dots() {
    print -Pn "%F{red}…%f"
    zle expand-or-complete
    zle redisplay
  }
  zle -N expand-or-complete-with-dots
  # Set the function as the default tab completion widget
  bindkey -M emacs "^I" expand-or-complete-with-dots
  bindkey -M viins "^I" expand-or-complete-with-dots
  bindkey -M vicmd "^I" expand-or-complete-with-dots
fi

# end-zstyle

# path
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# starship.rs
eval "$(starship init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# this is needed for fixing keybindings when using antigen vim plugin jeffreytse/zsh-vi-mode
# https://github.com/jeffreytse/zsh-vi-mode/blob/master/README.md#execute-extra-commands
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')

# history-substring-search plugin settings
# bind up arrow and down arrow keys
# https://github.com/jeffreytse/zsh-vi-mode/issues/165
zvm_after_init_commands+=("bindkey '^[[A' history-substring-search-up" "bindkey '^[[B' history-substring-search-down")
# vim mode bindings
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=white,bold"
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'
#

#GO
# export PATH=$PATH:/usr/local/go/bin
# export GOPATH=$HOME/GoProject
# export PATH=$PATH:$GOPATH/bin

# asdf
# . /usr/local/opt/asdf/libexec/asdf.sh

# bun completions
# [ -s "/Users/mesut/.bun/_bun" ] && source "/Users/mesut/.bun/_bun"

# pnpm
export PNPM_HOME="/Users/mesut/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# lazygit config path
export CONFIG_DIR="$HOME/.config/lazygit"
