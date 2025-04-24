if status is-interactive
    # freshfetch | lolcat
end

alias l "eza -lag --sort=type"
alias lt "eza --tree"

function v
    if test -n "$argv"
        nvim $argv
    else
        nvim (fzf)
    end
end

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

set -Ua fish_user_paths /opt/android-sdk/cmdline-tools/latest/bin
set -U ANDROID_SDK_ROOT /opt/android-sdk
set -U JAVA_HOME /usr/lib/jvm/java-17-openjdk

set -U EDITOR helix
set -U VISUAL helix

set fish_greeting

# Starship Prompt
function starship_transient_prompt_func
    starship module character
end
starship init fish | source
enable_transience

zoxide init fish | source
