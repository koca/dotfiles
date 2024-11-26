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
# nullglob needed for the error "no matches found:"
setopt nullglob  # Make globs that match nothing expand to empty string
for dir in $HOME/.config/zsh/aliases $HOME/.config/zsh/private; do
  if [[ -d "$dir" ]]; then  # Check if directory exists
    for file in $dir/*; do
      [ -f "$file" ] && source "$file"
    done
  fi
done
unsetopt nullglob  # Reset the option to its default

