fish_vi_key_bindings

function fish_greeting
end

# To just rerun your last command, simply type '!!'
# '!! sudo' will prepend sudo to your most recent command
# Running !! with anything other than sudo will append the argument to your most recent command
# To add another command to prepend list remove the # on line 10 and put the command in the quotes. Repeat as needed
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
