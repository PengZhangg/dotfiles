#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── helpers ───────────────────────────────────────────────────────────────────

info()    { printf "\033[0;34m  ➜  %s\033[0m\n" "$*"; }
success() { printf "\033[0;32m  ✓  %s\033[0m\n" "$*"; }
warn()    { printf "\033[0;33m  !  %s\033[0m\n" "$*"; }

link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    warn "Backing up existing $dst → $dst.bak"
    mv "$dst" "$dst.bak"
  fi
  ln -sfn "$src" "$dst"
  success "Linked $dst"
}

# ── Homebrew ──────────────────────────────────────────────────────────────────

if ! command -v brew &>/dev/null; then
  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

info "Installing packages from Brewfile..."
brew bundle --file="$DOTFILES/Brewfile"

# ── oh-my-zsh ─────────────────────────────────────────────────────────────────

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  info "Installing oh-my-zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# ── Symlinks: shell ───────────────────────────────────────────────────────────

link "$DOTFILES/shell/.zshrc"   "$HOME/.zshrc"
link "$DOTFILES/shell/.p10k.zsh" "$HOME/.p10k.zsh"

# ── Symlinks: git ─────────────────────────────────────────────────────────────

link "$DOTFILES/git/.gitconfig"         "$HOME/.gitconfig"
link "$DOTFILES/git/.gitignore_global"  "$HOME/.gitignore_global"

# ── Symlinks: tmux ────────────────────────────────────────────────────────────

link "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"

# ── Symlinks: ~/.config ───────────────────────────────────────────────────────

for app in borders btop ghostty nvim sketchybar; do
  link "$DOTFILES/config/$app" "$HOME/.config/$app"
done

# ── macOS tweaks ─────────────────────────────────────────────────────────────

SCRIPT_SRC="$DOTFILES/tweaks/macos/bin/monitor-rectangle-gap.sh"
SCRIPT_DST="$HOME/.local/bin/monitor-rectangle-gap.sh"
PLIST_SRC="$DOTFILES/tweaks/macos/launch-agents/com.pengzhang.monitor-rectangle-gap.plist"
PLIST_DST="$HOME/Library/LaunchAgents/com.pengzhang.monitor-rectangle-gap.plist"

mkdir -p "$HOME/.local/bin"
link "$SCRIPT_SRC" "$SCRIPT_DST"
chmod +x "$SCRIPT_DST"

# Write the plist with the resolved script path
sed "s|SCRIPT_PATH|$SCRIPT_DST|g" "$PLIST_SRC" > "$PLIST_DST"
launchctl unload "$PLIST_DST" 2>/dev/null || true
launchctl load "$PLIST_DST"
success "Loaded LaunchAgent: monitor-rectangle-gap"

# ── Done ──────────────────────────────────────────────────────────────────────

success "Done! Open a new shell to apply changes."
