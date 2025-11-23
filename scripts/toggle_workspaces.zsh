#!/usr/env/env zsh

# Get the directory of the script
declare dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

declare split_config="$DIR/../workspaces_split.conf"
declare mirror_config="$DIR/../workspaces_mirror.conf"
declare current_config="$DIR/../workspaces.conf"

[[ -L "$current_config" ]] && [[ "$(readlink -f "$current_config")" == "$split_config" ]] \
    && ln -sf "$mirror_config" "$current_config" \
    || ln -sf "$split_config" "$current_config"

hyprctl reload
