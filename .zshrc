autoload -Uz vcs_info compinit
compinit

# prompt
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

local p_host=""
if [[ -n "${REMOTEHOST}${SSH_CONNECTION}" ]]; then
  local rhost=‘who am i|sed ’s/.*((.*)).*/1/’‘
  rhost=${rhost#localhost:}
  rhost=${rhost%%.*}
  p_host="%B%F{yellow}($rhost)%f%b:"
fi
local p_info="%F{blue}%~%f"
local p_mark="%B%(?,%F{green},%F{red})%(!,#,>)%f%b"

PROMPT='${p_host}%n ${p_mark} '
RPROMPT='${p_info} ${vcs_info_msg_0_}'

# option
export LANG=ja_JP.UTF-8
## cdを入力しなくてもディレクトリ名で移動できる
setopt auto_cd
## cd -[tab]で移動ディレクトリ履歴を表示
setopt auto_pushd
setopt hist_ignore_all_dups
setopt share_history
autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# alias
alias ls='ls -aF'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias cat='cat -n'
alias less='less -NM'
alias phpstorm='open -a Phpstorm'

# alias git
alias gitst='git status'
alias gitd='git diff'
alias gita='git add'
alias gitch='git checkout'
alias gitchb='git checkout -b'
alias gitco='git commit -m'

export PATH=$PATH:~/local/bin:~/.composer/vendor/bin
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH=$HOME/.nodebrew/current/bin:$PATH
