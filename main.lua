-- main.lua
local board = require("board") -- Default board state by id
local pieces = require("pieces") -- List of piece metadata by id
local checkmove = require("checkmove") -- Check if a move is valid based on several factors
local getmove = require("getmove") -- Get user input and output the move state
local player = 0

local function printboard() -- Print the board to the console
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

local function check(start, finish) -- Run checkmove with just the move values as arguments
	return checkmove(board, pieces, player, start, finish)
end

local function move()
	repeat
		local input = getmove()
	until(check(input.start, input.finish))
	board[input.finish.x][input.finish.y] = board[input.start.x][input.start.y]
	board[input.start.x][input.start.y] = 1
	player = (player + 1) % 2
end

printboard()
check({x = 1, y = 1}, {x = 1, y = 1})
