-- getmove.lua
local function getmove(board, player)
	io.write("   Player "..(player + 1)..", please enter\n   your move: ")
	local y1, x1, y2, x2 = io.read("*n"), io.read("*n"), io.read("*n"), io.read("*n")
	return {
		start = {
			x = board.height + 1 - x1,
			y = y1
		},
		finish = {
			x = board.height + 1 - x2,
			y = y2
		}
	}
end
return getmove
