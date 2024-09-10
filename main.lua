-- main.lua
local board = require("board") -- Default board state by id
local pieces = require("pieces") -- List of piece metadata by id
local checkmove = require("checkmove") -- Check if a move is valid based on several factors
local getmove = require("getmove") -- Get user input and output the move state
local printboard = require("printboard") -- Print the current board state
local empty = require("empty")
local getneighbors = require("getneighbors")
local playing = true
local player = 0
local winner = -1

local function check(start, finish) -- Run checkmove with just the move values as arguments
	return checkmove(board, pieces, player, start, finish)
end

local function move()
	local input
	repeat
		input = getmove(board, player)
	until(check(input.start, input.finish))
	board[input.finish.x][input.finish.y] = board[input.start.x][input.start.y]
	board[input.start.x][input.start.y] = empty[input.start.x][input.start.y]
	player = (player + 1) % 2
	return input
end

local function checkcapture(pos, moved)
	return true
end

local function checkstate(state)
	if ((state.x == 1) or (state.x == board.width)) and ((state.y == 1) or (state.y == board.height)) then
		winner = 1
	end
	neighbors = getneighbors(state, board)
	for i=1,#neighbors,1 do
		if pieces[board[neighbors[i].x][neighbors[i].y]].player == player then
			if checkcapture(neighbors[i], state) then
				if board[neighbors[i].x][neighbors[i].y] == 2 then
					board.attackers = board.attackers - 1
				elseif board[neighbors[i].x][neighbors[i].y] == 3 then
					board.defenders = board.defenders - 1
				else
					winner = 0
				end
				if board.attackers == 0 then
					winner = 1
				end
				board[neighbors[i].x][neighbors[i].y] = empty[neighbors[i].x][neighbors[i].y]
			end
		end
	end
end

print("Rules:")
print("1. Every Piece moves like a rook in chess.")
print("2. No piece may pass over or land on another piece.")
print("3. To capture a piece, it must be surrounded on two opposing sides")
print("   by the opponent's pieces, the corners, the center, and/or edges.")
print("4. A piece is only captured when the opposing  player moves their piece")
print("   to capture it, not if it comes to rest in a given position.")
print("5. The defending King needs to be surrounded on all sides to be taken.")
print("6. The king is the only piece which may occupy the corners or center of")
print("   the board.")
print("7. To win, either the king must make it to a corner, or the King must be")
print("   captured.")
print("\nMoves are made, with the bottom left as the origin, as follows:\n\n   [x1, y1, x2, y2]\n")
print("There are more complex versions of the game out there, but this")
print("simplified version is the one that this program follows")

repeat
	printboard(board, pieces)
	local update = move()
	checkstate(update.finish)
	if winner > -1 then
		printboard(board, pieces)
		print("   Player "..(winner + 1).." Wins!")
		playing = false
	end
until(not playing)
