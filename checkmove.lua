-- checkmove.lua
local function checkmove(board, pieces, player, start, finish)
	if 0 <= start.x or 0 <= start.y or 0 <= finish.x or 0 <= finish.y then
		return false
	end
	if start.x > board.width or start.y > board.height or finish.x > board.width or finish.y > board.y then
		return false
	end
	if not player == pieces[board[start.x][start.y]] then
		return false
	end
	if not start.x == finish.x and not start.y == finish.y then
		return false
	end
	return true	
end
return checkmove
