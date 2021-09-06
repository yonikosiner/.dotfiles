# Enabling and setting git info var to be used in prompt config.
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
# This line obtains information from the vcs.
zstyle ':vcs_info:git*' formats "- (%b) "
precmd() {
    vcs_info
}

bindkey -s ^f "~/scripts/bg -a\n"
bindkey -s ^u "~/scripts/bg -v\n"

bindkey -s ^@ "~/scripts/tmux2\n"

alias clangd="/Users/yonikosiner/Downloads/clang+llvm-12.0.0-aarch64-linux-gnu/bin/clangd"

alias urlS="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -dump URLSchemeBinding"

alias iCloud="cd /Users/yonikosiner/Library/Mobile\ Documents/com~apple~CloudDocs"

alias obsidian="cd /Users/yonikosiner/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Main\ obsidian\ vault"

alias ls="ls -A"

# Enable substitution in the prompt.
setopt prompt_subst

# Config for the prompt. PS1 synonym.
prompt='[%2/]${vcs_info_msg_0_}$ '

EDITOR=nvim
VISUAL=nvim

alias c="clear"
alias ll="ls -lh"
alias ..="cd .."
alias keyboard="setxkbmap -layout real-prog-dvorak"


alias bg="~/scripts/bg"

alias :q="exit"

alias mv='mv -i'
alias rm='rm -i'

alias nvim="~/nvim-osx64/bin/nvim"
alias vim="nvim"

alias evrc="vim /Users/yonikosiner/.config/nvim"

alias work="bash ~/scripts/work.sh"
alias school="bash ~/scripts/school.sh"

bindkey -v
