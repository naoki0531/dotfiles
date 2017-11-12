# prompt
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

local p_info="%m:%F{green}%~%f"
local p_mark="%B%(?,%F{green},%F{red})%(!,#,>)%f%b"
PROMPT='${p_info} %n ${p_mark} '
RPROMPT='${vcs_info_msg_0_}'

# option
export LANG=ja_JP.UTF-8
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