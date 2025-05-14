#!/usr/bin/env bash

function main()
{
  local dotfiles_dir="${HOME}/dotfiles"

  print_info "Cloning dotfiles"
  git clone "$dotfiles_repo_url" "$dotfiles_dir"

  print_info "Linking config folders"
  for dir in "$dotfiles_dir"/*/; do
    local name=$(basename "$dir")
    ln -sfn "$dir" "${HOME}/.config/$name"
    print_ok "Linked $name to ~/.config"
  done

  print_ok "Dotfiles setup complete"
}

main "$@"
