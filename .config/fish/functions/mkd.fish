function mkd -d "Create a directory and set CWD"
    command mkdir $argv
    if test $status = 0
        set -l last_arg $argv[-1]
        if not string match -q -- '-*' $last_arg
            cd $last_arg
        end
    end
end