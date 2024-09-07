-- checkmove.lua
local function checkmove(board, pieces, player, start, finish)
	if start.x <= 0 or start.y <= 0 or finish.x <= 0 or finish.y <= 0 then
		return false
	end
	if start.x > board.width or start.y > board.height or finish.x > board.width or finish.y > board.height then
		return false
	end
	if not (player == pieces[board[start.x][start.y]].player) then
		return false
	end
	if not (start.x == finish.x or start.y == finish.y) then
		return false
	end
	return true	
end
return checkmove
