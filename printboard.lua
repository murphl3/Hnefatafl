-- printboard.lua
local function printboard(board, pieces)
	local function printedge()
		io.write("   +")
		for i=1,(board.width * 2) + 1,1 do
			io.write("-")
		end
		print("+")
	end
	print()
	printedge()
	for row=1,board.height,1 do
		io.write("   | ")
		for col=1,board.width,1 do
			io.write(pieces[board[row][col]].char.." ")
		end
		print("|")
	end
	printedge()
	print()
end
return printboard
