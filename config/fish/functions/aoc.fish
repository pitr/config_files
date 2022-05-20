function aoc
    set year (basename (pwd))
    set day (dc -e "$argv[1] p")
    curl --cookie session=COOOOOKIEEEEEE https://adventofcode.com/$year/day/$day/input > in/$argv[1].txt
end

