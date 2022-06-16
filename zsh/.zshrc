# OH MY ZSH stuff
export ZSH="/home/yoni/.oh-my-zsh"

# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="robbyrussell"
plugins=(git command-time zsh-fzf-history-search)

export XDG_CONFIG_HOME=$HOME/.config
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
export XDG_RUNTIME_DIR=/run/user/1000
export MANPAGER='nvim +Man!'
export TERM="xterm-256color"

VIM="nvim"
export YONIKOSINER=$HOME/personal/yonikosiner-com.git
export TODO_ME_DADDY=$HOME/personal/todo-me-daddy/

export EDITOR="nvim"

source $ZSH/oh-my-zsh.sh

PERSONAL=$XDG_CONFIG_HOME/personal

for i in `find -L $PERSONAL`; do
    source $i
done

megaMind

# MacOS stuff
alias urlS="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -dump URLSchemeBinding"

alias iCloud="cd /Users/yonikosiner/Library/Mobile\ Documents/com~apple~CloudDocs"
autoload -U colors && colors

#[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1

export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json

# autoload -Uz vcs_info
# zstyle ':vcs_info:*' enable git svn
# zstyle ':vcs_info:git*' formats " %%B%{$fg[yellow]λ %%B%{$fg[green]%b"
#
# precmd() {
#     vcs_info
# }
#
# PS1='%B$fg[magenta]%~%]${vcs_info_msg_0_}'$'\n'"$fg[green]$ %b"
# PROMPT='%B%F{219}[%f%b%B%F{219}%n%f%b %B$(pwd_t)%B%F{219}]%(!.#.$)%f%b '

bindkey -v
export KEYTIMEOUT=1

bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^o "nnn\n"
bindkey -s ^p "password\n"

source /home/yoni/personal/fzf-tab-completion/zsh/fzf-zsh-completion.sh
bindkey '^I' fzf_completion

alias luamake=/home/yoni/lua-language-server/3rd/luamake/luamake

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
