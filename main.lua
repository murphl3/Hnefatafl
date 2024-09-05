-- main.lua
local board = require("board")
local pieces = require("pieces")

function printboard()
	local col = 1
	repeat
		local row = 1
		local str = ""
		repeat
			str = str..pieces[board[col][row]].char
			row = row + 1
		until(row > board.width)
		print(str)
		col = col + 1
	until(col > board.height)
end

printboard()
