if status is-interactive
    fastfetch
end

alias l "eza -lag --sort=type"
alias lt "eza --tree"

function h
    if test -n "$argv"
        helix $argv
    else
        helix (fzf)
    end
end

fish_add_path $HOME/.cargo/bin/
fish_add_path $HOME/.npm-global/bin/
fish_add_path $HOME/.pub-cache/bin/

if test "$USER" = franky
    set -gx ANDROID_HOME $HOME/Android/Sdk/
    set -gx CHROME_EXECUTABLE /usr/bin/chromium
    mise activate fish | source
end

set -gx EDITOR helix
set -gx VISUAL helix
set -gx FZF_DEFAULT_COMMAND "fd -H"
# set -gx LIBSEAT_BACKEND logind
# set -gx WLR_NO_HARDWARE_CURSORS = 1
# set -gx WLR_RENDERER vulkan
# set -gx QT_QPA_PLATFORM = "wayland;xcb"
# set -gx KITTY_ENABLE_WAYLAND = 1
# set -gx LIBVA_DRIVER_NAME = nvidia
# set -gx XDG_SESSION_TYPE = wayland
# set -gx GBM_BACKEND = nvidia-drm
# set -gx __GLX_VENDOR_LIBRARY_NAME = nvidia
# set -gx ELECTRON_OZONE_PLATFORM_HINT = auto
# set -gx NVD_BACKEND direct

set fish_greeting

# Starship Prompt
function starship_transient_prompt_func
    starship module character
end
starship init fish | source

enable_transience

zoxide init fish | source
