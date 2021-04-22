function g
  if test (count $argv) -eq 0
    set argv s
  end
  git $argv
end
