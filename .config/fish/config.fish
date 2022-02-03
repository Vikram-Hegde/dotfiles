fish_vi_key_bindings

set -gx EDITOR nvim

function !!;
  set var (history | head -n 1)
  if test $argv
    if test $argv = "sudo"        #; or "any other command you want to prepend"
        eval $argv $var
    else
        eval $var $argv
    end
    else
        eval $var
  end
end

set -gx LS_COLORS ':ow=01;33'

# Starship prompt
starship init fish | source
