
eval "$(/opt/homebrew/bin/brew shellenv)"

# Coreutils
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# ZSH settings
source $HOME/.config/zsh/zsettings

#region colors
# Directory and Suggestion Colors
## this makes the directory and suggestion colors(when you type cd and press tab) same as `ls` command
eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS} "ma=33"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=15'
#endregion


#region vim
# Vim Mode
## Color settings
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=white,bold"
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'

## fix keybindings for plugin: `jeffreytse/zsh-vi-mode`
function zvm_after_init() {
  ### https://github.com/jeffreytse/zsh-vi-mode/blob/master/README.md#execute-extra-commands
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  ### bind up arrow and down arrow keys https://github.com/jeffreytse/zsh-vi-mode/issues/165
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down

  ### history-substring-search plugin settings
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
}
# endregion


# Zoxide
ZOXIDE_CMD_OVERRIDE="cd"

# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
