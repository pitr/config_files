function clone
    git clone $argv
    cd (basename -s .git $argv[1])
end
