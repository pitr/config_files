function aoc
        if test -z "$aoc"
                echo aoc is not set && return 42
        end
        set day $argv[1]
        set year (basename (pwd))
        set file (printf "%02d" $day)
        touch in/"$file"e.txt
        curl -s -H "cookie: session=$aoc" "https://adventofcode.com/$year/day/$day/input" > in/$file.txt
        echo >$file.apl "\
⎕CY'dfns'
⎕← display ⊃⎕NGET'in/"$file"e.txt'1"
        subl $file.apl in/"$file"e.txt
end
