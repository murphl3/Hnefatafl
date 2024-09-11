This is an implementation of "Hnefatafl" in Lua.
To run it, you just need to run the main.lua file.
The rules are explained upon starting the game, but the input scheme might not be the easiest to decipher at the moment.
The coordinates (1, 1) are the bottom left corner, and each row and column goes up to eleven.
Here are a few simple examples of inputs:

Initial State:
+-------+
| - - - |
| - X - |
| - - - |
+-------+
Input: 2 2 1 1
+-------+
| - - - |
| - - - |
| X - - |
+-------+
Input: 1 1 3 2
+-------+
| - - - |
| - - X |
| - - - |
+-------+
Input: 3 2 2 3
+-------+
| - X - |
| - - - |
| - - - |
+-------+
