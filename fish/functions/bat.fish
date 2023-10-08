function bat --wraps="batcat"
    if which -s bat
        command bat $argv
    else if which -s batcat
        batcat $argv
    else
        cat $argv
    end
end

