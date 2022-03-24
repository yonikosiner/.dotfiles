export XDG_CONFIG_HOME=$HOME/.config
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
export XDG_RUNTIME_DIR=/run/user/1000
export MANPAGER='nvim +Man!'

VIM="nvim"
export YONIKOSINER=$HOME/personal/yonikosiner-com.git

export EDITOR="nvim"

PERSONAL=$XDG_CONFIG_HOME/personal

for i in `find -L $PERSONAL`; do
    source $i
done

# MacOS stuff
alias urlS="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -dump URLSchemeBinding"

alias iCloud="cd /Users/yonikosiner/Library/Mobile\ Documents/com~apple~CloudDocs"

#[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1

bindkey -v
export KEYTIMEOUT=1
export ZSH="/home/yoni/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
DISABLE_LS_COLORS="false"
plugins=(git zsh-autosuggestions command-time)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
# This line obtains information from the vcs.
zstyle ':vcs_info:git*' formats "%B%{$fg[green]  %b"

precmd() {
    vcs_info
}

prompt='[%2/]${vcs_info_msg_0_} %b'

bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^o "nnn\n"
bindkey -s ^h "zsh-history\n"

alias luamake=/home/yoni/lua-language-server/3rd/luamake/luamake
