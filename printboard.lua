-- printboard.lua
local function printboard(board, pieces)
	for row=1,board.height,1 do
		for col=1,board.width,1 do
			io.write(pieces[board[row][col]].char.." ")
		end
		print()
	end
end
return printboard
