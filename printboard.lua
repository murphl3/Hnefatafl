-- printboard.lua
local function printboard(board, pieces)
	local row = 1
	repeat
		local col = 1
		local str = ""
		repeat
			str = str..pieces[board[row][col]].char
			col = col + 1
		until(col > board.height)
		print(str)
		row = row + 1
	until(row > board.width)
end
return printboard
