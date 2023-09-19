function bat --wraps="batcat"
    if not (which bat) 
        batcat $argv
    end
end

