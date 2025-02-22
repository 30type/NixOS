# don't greet
function fish_greeting
end

function starship_transient_prompt_func
    starship module character
end
# Map '-' to cd back to previous directory
abbr -a -- - prevd

# use vi bindings
set -g fish_key_bindings fish_vi_key_bindings

# Emulates vim's cursor shape behavior
set -g fish_vi_force_cursor 1
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursors to an underscore
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore

function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd

function starship_transient_prompt_func
    starship module character
end
starship init fish | source
enable_transience
