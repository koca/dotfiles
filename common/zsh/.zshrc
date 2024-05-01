# enable next line for profiling performance
# zmodload zsh/zprof


autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C


# ZSH PKG Manager
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load


# Starship.rs
eval "$(starship init zsh)"


# Aliases
## load aliases from both public and private directories
for dir in $HOME/.config/zsh/aliases $HOME/.config/zsh/private; do
  for file in $dir/*; do
    [ -f "$file" ] && source "$file"
  done
done
