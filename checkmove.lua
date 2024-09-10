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
	local path = {}
	local fixed = 0
	if start.x < finish.x then
		fixed = start.y
		for tmp=start.x + 1, finish.x,1 do
			table.insert(path, {x = tmp, y = fixed})
		end
	elseif start.x > finish.x then
		fixed = start.y
		for tmp=start.x - 1, finish.x,-1 do
			table.insert(path, {x = tmp, y = fixed})
		end
	elseif start.y < finish.y then
		fixed = start.x
		for tmp=start.y + 1, finish.y,1 do
			table.insert(path, {x = fixed, y = tmp})
		end
	elseif start.y > finish.y then
		fixed = start.x
		for tmp=start.y - 1, finish.y,-1 do
			table.insert(path, {x = fixed, y = tmp})
		end
	else
		return false
	end
	for ptr=1,#path,1 do
		if not (pieces[board[path[ptr].x][path[ptr].y]].player == 2) then
			return false
		end
	end
	if (not (board[start.x][start.y] == 4)) and (board[finish.x][finish.y] == 5) then
		return false
	end
	return true	
end
return checkmove
