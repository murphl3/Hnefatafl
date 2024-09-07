-- getmove.lua
local function getmove(board)
	io.write("Please enter your move: ")
	local a, b, c, d = io.read("*n"), io.read("*n"), io.read("*n"), io.read("*n")
	return {
		start = {
			x = board.height + 1 - b,
			y = a
		},
		finish = {
			x = board.height + 1 - d,
			y = c
		}
	}
end
return getmove
