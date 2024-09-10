--getneighbors.lua)
local function getneighbors(pos, board)
	local neighbors = {}
	if pos.x < board.width then
		table.insert(neighbors, {x = pos.x + 1, y = pos.y})
	end
	if pos.x > 1 then
		table.insert(neighbors, {x = pos.x - 1, y = pos.y})
	end
	if pos.y < board.height then
		table.insert(neighbors, {x = pos.x, y = pos.y + 1})
	end
	if pos.y > 1 then
		table.insert(neighbors, {x = pos.x, y = pos.y - 1})
	end
	return neighbors
end
return getneighbors