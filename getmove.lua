-- getmove.lua
local function getmove()
	io.write("Please enter your move: ")
	return {
		start = {
			x = io.read("*n"),
			y = io.read("*n")
		},
		finish = {
			x = io.read("*n"),
			y = io.read("*n")
		}
	}
end
return getmove
