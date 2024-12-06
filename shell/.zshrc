export XDG_CONFIG_HOME="$HOME/.config"


if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
source <(fzf --zsh)
eval "$(fnm env --use-on-cd --resolve-engines=true --version-file-strategy=recursive --log-level=error)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
alias docker-wipe='docker system prune --force && docker system prune -a --force && docker volume prune --force'

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/gcloud/application_default_credentials.json

rustup completions zsh > ~/.zfunc/_rustup
dir="$HOME/.zsh-complete"
mkdir -p "$dir"
rg --generate complete-zsh > "$dir/_rg"
pulumi gen-completion zsh > "$dir/_pulumi"

eval "$(zoxide init zsh)"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/.cargo/bin"
alias ls='lsd'

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
eval "$(cloud-sql-proxy completion zsh)"

macchina