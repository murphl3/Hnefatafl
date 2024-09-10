-- checkcapture.lua
local getneighbors = require("getneighbors")
local function checkcapture(pos, moved, board, pieces, player)
  if true then return true end
  local neighbors = getneighbors(pos, board)
  if board[pos.x][pos.y] == 4 then
    if board.defenders == 0 then
      local captured = true
      for i=1,#neighbors,1 do
        if (board[neighbors[i].x][neighbors[i].y] == 1) or (((neighbors.x == 0) or (neighbors.x == board.width)) and ((neighbors.y == 0) or (neighbors.y == board.height))) then
          captured = false
          break
        end
      end
      return captured
    else
      
    end
  end
  return false
end
return checkcapture