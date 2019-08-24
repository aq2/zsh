#   general
  stty -ixon
  TERM=xterm
  HISTSIZE=10000
  SAVEHIST=10000
  export VISUAL=vim
  HOSTNAME=$(hostname)
  export hostname=$HOSTNAME
  HISTFILE=~/.local/zsh_history
  fpath=("$HOME/.config/zsh" $fpath)
  export PATH=$HOME/bin:$HOME/bin/color:/usr/local/bin:$PATH

  setopt autocd
  unsetopt correct
  unsetopt correctall
  setopt extendedglob
  setopt append_history
  setopt hist_ignore_dups
  setopt hist_ignore_space
  setopt inc_append_history
  setopt hist_reduce_blanks

# Key bindings
  bindkey '^A'      beginning-of-line       # Home
  bindkey '^D'      delete-char             # Del
  bindkey '^E'      end-of-line             # End
  bindkey '\e[2~'   overwrite-mode          # Insert
  bindkey '\e[3~'   delete-char             # Del
  bindkey '\e[1;5C' forward-word            # C-Right
  bindkey '\e[1;5D' backward-word           # C-Left

#   fzf
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow
    \  --exclude .git --exclude .cache --exclude .mozilla --exclude .local'

  export PATH="$PATH:/home/angelo/.config/fzf/bin"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPS="--layout=reverse-list ---layout=reverse --border"

  source "/home/angelo/.config/fzf/shell/key-bindings.zsh"
  source "/home/angelo/.config/zsh/plugins/zsh-z.plugin.zsh"

  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  [[ $- == *i* ]] && source "/home/angelo/.config/fzf/shell/completion.zsh" 2> /dev/null

# misc
  autoload -U compinit && compinit
  zstyle ':completion:*' menu select
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
  zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# not for server
  if [[ $hostname != 'drip' ]]
  then
    source /etc/profile.d/vte.sh
    setxkbmap -option caps:escape
  fi


#  alias
  alias xx='exit'
  alias ..='cd ..'
  alias ll='ls -l'
  alias l.='ls -d .*'
  alias grok='./grok'
  alias xo='xdg-open'
  alias ssh='color-ssh'
  alias gpus='git push'
  alias gpul='git pull'
  alias gadd='git add .'
  alias ping='ping -c 5'
  alias gsta='git status'
  alias gcom='git commit -m'
  alias update='pkcon update'
  alias zeesh='source ~/.zshrc'
  alias logmeout='pkill -u angelo'
  alias upgrade='sudo apt upgrade'
  alias upg='apt list --upgradable'
  alias blame='systemd-analyze blame'
  alias gvim='gvim --remote-tab-silent'
  alias la="ls -lha | sed -re 's/^[^ ]* //'"
  alias sshaghar='ssh ayurvedi@shell.gridhost.co.uk'
  alias ls='ls --color=auto --group-directories-first'
  alias myvpn='sudo openvpn ~/Nextcloud/serva/dripvpn.ovpn'
  alias glog='git log --pretty="%Cgreen%h  %Cblue%ar%Creset  %s"'


# fancy functions

  take() {
    mkdir -p $1; cd $1
  }

  se() {
    find . | fzf | xargs -o $VISUAL;
  }

  color-ssh() {
    trap "ssh-termcolor.sh" INT EXIT
    if [[ "$*" =~ "mickey" ]]; then
        ssh-termcolor.sh mickey
    elif [[ "$*" =~ "think" ]]; then
        ssh-termcolor.sh mickey
    elif [[ "$*" =~ "drip" ]]; then
        ssh-termcolor.sh drip
    elif [[ "$*" =~ "shell.gridhost.co.uk" ]]; then
        ssh-termcolor.sh shell.gridhost.co.uk
    else
        ssh-termcolor.sh foo
    fi
    'ssh' $*
  }
  compdef _ssh color-ssh=ssh

 source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  # ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
  # ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
  # ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
  # ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue


#  hacked pure prompt
  autoload -U promptinit && promptinit
	# RPROMPT='%F{white}%*'
	PURE_PROMPT_SYMBOL=
  prompt pura
  prompt_newline='%666v'
  PROMPT=" $PROMPT"

