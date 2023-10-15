# Disable fish greeting
set fish_greeting

# Set default editor to VS Code Insiders
set -u EDITOR vscode-insiders

# Symlink Firefox Developer Edition to /usr/local/bin/firefox
if not test -L /usr/local/bin/firefox
    set firefox_bin (which firefox-developer-edition)

    if test -n "$firefox_bin"
        sudo ln -s $firefox_bin /usr/local/bin/firefox
        echo "Symlink created: Firefox Developer Edition is now the default browser."
    else
        echo "Firefox Developer Edition binary not found. Please install it or adjust the path in the script."
    end
end

# Directory aliases
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."

# Enhanced commands aliases
alias ll "lsd -lF --no-sort --permission rwx --group-directories-first -a"
alias ls "lsd -F --group-directories-first -a"
alias tree "tre"

# Common directories
alias workspace "cd $HOME/Documents/workspace"
alias configuration "cd $HOME/.config"
alias documents "cd $HOME/Documents"
alias downloads "cd $HOME/Downloads"

# Add local binaries to PATH
set PATH $HOME/.cargo/bin $PATH
set PATH $HOME/.config/composer/vendor/bin $PATH
set PATH $HOME/.local/bin $PATH
set PATH find $HOME/.sdkman/candidates/*/current/bin -maxdepth 0 $PATH
set --export PATH $HOME/go/bin $PATH

# Miscellaneous environment variables
set -gx GPG_TTY (tty)
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx NX_DAEMON false

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
pyenv init - | source

# fnm
set PATH $HOME/.fnm $PATH
set -gx FNM_COREPACK_ENABLED true
fnm env --use-on-cd | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# starship
starship init fish | source
