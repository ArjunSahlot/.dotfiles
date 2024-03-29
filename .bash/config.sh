# Virualenv
# export WORKON_HOME=$HOME/.virtualenvs
# VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
# . ~/.local/bin/virtualenvwrapper.sh

# Commands path
PATH=$PATH:/home/arjun/bin
export PATH=$PATH:/opt/gradle/gradle-7.3.3/bin
export PATH=$PATH:/lib/jvm/jdk-17/bin
export PATH=$PATH:/usr/local/texlive/2022/bin/x86_64-linux
export PATH=$PATH:/home/arjun/.pub-cache/bin
export PATH=$PATH:/home/arjun/.local/bin
export PATH=$PATH:/home/arjun/.codon/bin
export PATH=$PATH:/home/arjun/.modular/pkg/packages.modular.com_mojo/bin
export PATH=$PATH:/home/arjun/apps/nvim-linux64/bin
export PATH=$PATH:/home/arjun/perl5/bin
export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share
export XDG_DATA_DIRS=$XDG_DATA_DIRS:/home/arjun/.local/share/flatpak/exports/share
export XDG_CONFIG_HOME="$HOME/.config"
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
export MODULAR_HOME="/home/arjun/.modular"
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
export PYGMENTIZE_STYLE='one-dark'
export VISUAL=nvim
export EDITOR=nvim
export HISTSIZE=100000
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

# tmux history compatibility
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export PERL5LIB=$PERL5LIB:/home/arjun/perl5/lib/perl5
export PERL_LOCAL_LIB_ROOT=$PERL_LOCAL_LIB_ROOT:/home/arjun/perl5
export PERL_MB_OPT="--install_base \"/home/arjun/perl5\""
export PERL_MM_OPT="INSTALL_BASE=/home/arjun/perl5"


[ -f ~/.inshellisense/key-bindings.bash ] && source ~/.inshellisense/key-bindings.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"

export PNPM_HOME="/home/arjun/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

eval "$(lesspipe)" 
eval "$(zoxide init bash)"
eval "$(thefuck --alias)"
eval "$(github-copilot-cli alias -- "$0")"
eval "$(starship init bash)"

set -o vi
