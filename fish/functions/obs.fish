set _OBSIDIAN_EDITOR_LOC '/Users/lyra/Documents/Work/Obsidian Editor'


function obs --wraps=open --description "Opens file in obsidian"
    # Parse arguments
    # Get the value of the file parameter
    set -f file $argv[1]
    if not test -f $file
        echo "Not a file: $file" >&2
        return 1
    end

    set -f path (realpath $file)
    set -f base_name (path basename $path)
    # Function code goes here
    echo "Opening symlinked $path in Obsidian"

    ln -s $path "$_OBSIDIAN_EDITOR_LOC/$base_name"
    open -a Obsidian "$_OBSIDIAN_EDITOR_LOC/"

end
