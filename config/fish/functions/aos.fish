function aos
        set day $argv[1]
        set level $argv[2]
        set answer $argv[3]
        set year (basename (pwd))
        set file (printf "%02d" $day)
        curl -s -H "cookie: session=$aoc" -d "level=$level" -d "answer=$answer" "https://adventofcode.com/$year/day/$day/answer" \
                | xmllint --html --xpath '//article/p' - 2>/dev/null
end
