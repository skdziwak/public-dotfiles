# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Basic settings
EDITOR=nvim

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt histignorealldups
setopt incappendhistory

# Basic auto/tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias la='ls -la'
alias lg='lazygit'
alias vim='nvim'
alias pacman='sudo pacman'
alias dnf='sudo dnf'
alias save='~/dotfiles/save.sh'
alias dot='~/dotfiles/save.sh'
alias ssh='kitten ssh'
alias t='tmux has-session -t $(basename $(pwd)) 2>/dev/null || tmux new-session -s $(basename $(pwd)) -d; tmux attach -t $(basename $(pwd))'
alias svim='sudo nvim'
alias ide='nohup cursor . 2>&1 > /dev/null &'

# Initialize zoxide
eval "$(zoxide init zsh)" || true

# Custom prompt configuration
autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }

# Enable git information in prompt
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%f '
zstyle ':vcs_info:*' enable git

# Set the prompt
setopt PROMPT_SUBST
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f ${vcs_info_msg_0_}%(?:%F{green}➜%f :%F{red}➜%f ) '


# Auto-install plugins if not present
PLUGIN_DIR="${HOME}/.zsh/plugins"
mkdir -p "${PLUGIN_DIR}"

# Function to download and source a plugin
install_plugin() {
    local repo=$1
    local file=$2
    local plugin_name=$(basename "$repo")
    local plugin_path="${PLUGIN_DIR}/${plugin_name}"
    
    if [[ ! -d "${plugin_path}" ]]; then
        echo "Installing ${plugin_name}..."
        git clone "https://github.com/${repo}" "${plugin_path}"
    fi
    source "${plugin_path}/${file}"
}

# Install and load plugins
install_plugin "zsh-users/zsh-syntax-highlighting" "zsh-syntax-highlighting.zsh"
install_plugin "zsh-users/zsh-autosuggestions" "zsh-autosuggestions.zsh"
