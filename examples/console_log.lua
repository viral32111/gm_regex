require("regex")

local message = "viral32111<76561198168833275,STEAM_0:1:104283773> said \"Hello World!\""
local regularExpression="^(.+)<(\\d{17}),(STEAM_\\d:\\d:\\d+)> said \"(.*)\"$"

local matches = regex.match(message,regularExpression)

PrintTable(matches)

--[[ Output:
0       =       viral32111<76561198168833275,STEAM_0:1:104283773> said "Hello World!"
1       =       viral32111
2       =       76561198168833275
3       =       STEAM_0:1:104283773
4       =       Hello World!
]]