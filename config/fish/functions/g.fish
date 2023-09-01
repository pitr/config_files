function g
	if count $argv > /dev/null
		git $argv
	else
		git s
	end
end