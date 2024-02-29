# direnv
#eval "$(direnv hook zsh)"


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi


# Path to your oh-my-zsh installation.
#
# To remove any command from the zsh history file
histrm() { LC_ALL=C sed --in-place '/$1/d' $HISTFILE }

## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTFILESIZE=100000
HISTSIZE=100000
SAVEHIST=100000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data
export ZSH=~/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

#plugins=(git sudo zsh-autosuggestions asdf docker kubectl kubectx direnv) 
plugins=(git sudo zsh-autosuggestions asdf direnv) 

# User configuration

#export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $(dirname $(gem which colorls))/tab_complete.sh
source $ZSH/oh-my-zsh.sh


#autoload -U +X bashcompinit && bashcompinit
#complete -o nospace -C /usr/local/bin/vault vault

# added by Pew
source "$(pew shell_config)"

#vagrant autocomplete install --bash --zsh
# >>>> Vagrant command completion (start)
#fpath=(/tmp/.mount_vagran6cNA6x/usr/gembundle/gems/vagrant-2.2.10/contrib/zsh $fpath)
#compinit
# <<<<  Vagrant command completion (end)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

eval "$(assh completion  zsh)"

[[ $- == i ]] && source "/home/damien/.local/opt/fzf/shell/completion.zsh" 2> /dev/null
source "/home/damien/.local/opt/fzf/shell/key-bindings.zsh" 

#source <(register-python-argcomplete checkov)
#source <(helm completion zsh)
#source <(kind completion zsh)
#source ~/.local/opt/k0sctl

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

source ~/.zshrc.exports
source ~/.zshrc.aliases
