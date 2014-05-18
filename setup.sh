#!/usr/bin/env bash

TS=$(date +'%Y%m%d%H%M%S')
DOTFILES=$(cd $(dirname $0) && pwd)
source "${DOTFILES}/lib/utils"

echo

# submodule update
# ----------------------------------------------------------------------

cd $DOTFILES
git submodule update --init --recursive
cd - > /dev/null


# Install dotfiles
# ----------------------------------------------------------------------

log_header "Installing dotfiles..."
log_warn "This step may overwrite your existing dotfiles."
if confirm; then
  symlink "${DOTFILES}/shell/bash_profile" "${HOME}/.bash_profile"
  symlink "${DOTFILES}/git/gitignore"      "${HOME}/.gitignore"

  # create an empty .bash_profile.local
  cd $HOME
  [ ! -f .bash_profile.local ] && touch .bash_profile.local
  cd - > /dev/null

  # Backup .gitconfig
  cd $HOME
  if [ -f .gitconfig ]; then
    mv .gitconfig ".gitconfig-${TS}"
    log_info "Backup .gitconfig -> .gitconfig-${TS}"
  fi
  cd - > /dev/null

  # Copy `.gitconfig` rather than symlinking
  # since any global git commands in `~/.bash_profile.local` will be written to `.gitconfig`.
  #   This prevents them being committed to the repository.
  cp "${DOTFILES}/git/gitconfig" "${HOME}/.gitconfig"

  source ${HOME}/.bash_profile
  log_ok "Done!"
else
  log_info "Skipped."
fi
echo ""


# Install homebrew formulaes (only with osx)
# ----------------------------------------------------------------------

if [ $(uname -s) == "Darwin" ]; then
  # Check for Homebrew
  if [[ ! $(type -P brew) ]]; then
    log_header "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  fi

  # Install homebrew packages
  log_header "Installing homebrew packages..."
  if confirm; then
    brew bundle "${DOTFILES}/osx/homebrew/Brewfile"
    brew doctor
    log_ok "Done!"
  else
    log_info "Skipped."
  fi
  echo ""

  # Install osx native apps with brew cask
  log_header "Installing osx native apps..."
  if confirm; then
    brew bundle "${DOTFILES}/osx/homebrew/Caskfile"
    log_ok "Done!"
  else
    log_info "Skipped."
  fi
  echo ""
fi


# Install node packages
# ----------------------------------------------------------------------

log_header "Installing node packages..."
if confirm; then
  if [[ ! $(type -P nmp) ]]; then
    bash ${DOTFILES}/node/npm.sh
    log_ok "Done!"
  else
    log_error "npm command is not found."
  fi
else
  log_info "Skipped."
fi
echo ""


# All done!
log_success "All done!🍺"
