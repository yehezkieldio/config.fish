# Disable fish greeting
set fish_greeting

# Set default editor to VS Code Insiders
set -u EDITOR vscode-insiders

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
alias configuration "cd $HOME/.config"
alias downloads "cd $HOME/Downloads"
alias documents "cd $HOME/Documents"
alias workspace "cd $HOME/Documents/Workspace"
alias books "cd $HOME/Documents/Books"
alias playgrounds "cd $HOME/Documents/Playgrounds"

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
set -gx JAVA_HOME /home/elizielx/.sdkman/candidates/java/current
set -gx GRAALVM_HOME /home/elizielx/.sdkman/candidates/java/current/bin

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

# pnpm
set -gx PNPM_HOME "/home/elizielx/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
