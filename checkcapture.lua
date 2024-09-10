-- checkcapture.lua
local getneighbors = require("getneighbors")
local function checkcapture(pos, moved, board, pieces, player)
  if board[pos.x][pos.y] == 4 then
    local neighbors = getneighbors(pos, board)
    local captured = true
    if board.defenders == 0 then
      for i=1,#neighbors,1 do
        if (board[neighbors[i].x][neighbors[i].y] == 1) or (((neighbors.x == 0) or (neighbors.x == board.width)) and ((neighbors.y == 0) or (neighbors.y == board.height))) then
          captured = false
          break
        end
      end
      return captured
    else
      for i=1,#neighbors,1 do
        if (pieces[board[neighbors[i].x][neighbors[i].y]].player == 2) or (pieces[board[neighbors[i].x][neighbors[i].y]].player == 1) then
          captured = false
          break
        end
      end
      return captured
    end
  end
  local changed = 0
  if moved.x < pos.x then
    changed = pos.x + 1
    if (board.width < changed) or (pieces[board[changed][pos.y]].player == pieces[board[moved.x][moved.y]].player) then
      return true
    end
  elseif moved.x > pos.x then
    changed = pos.x - 1
    if (changed < 1) or (pieces[board[changed][pos.y]].player == pieces[board[moved.x][moved.y]].player) then
      return true
    end
  elseif moved.y < pos.y then
    changed = pos.y + 1
    if (board.width < changed) or (pieces[board[pos.x][changed]].player == pieces[board[moved.x][moved.y]].player) then
      return true
    end
  elseif moved.y > pos.y then
    changed = pos.y - 1
    if (changed < 1) or (pieces[board[pos.x][changed]].player == pieces[board[moved.x][moved.y]].player) then
      return true
    end
  end
  return false
end
return checkcapture