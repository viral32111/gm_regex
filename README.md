# Steam

**Project started: 15/11/2019, Last updated: 15/11/2019**

This is a C++ module for Garry's Mod which gives developers access to the Regular Expressions string matching standard. I wanted to make this because [Lua Patterns](https://wiki.garrysmod.com/page/Patterns) are limited in functionality and useless to learn if you've already learned Regex (also when there's already a standard in place they should never have been created in the first place)

### Installation
1. Download the [latest release](https://github.com/viral32111/gm_regex/releases) binary file for your operating system (`win32` for Windows, `osx` for MacOS and `linux` for Linux)
2. Rename the DLL prefix to match the realm you'll be using it on. (e.g. rename it to `gmsv_regex_win32.dll` if you're using it serverside on Windows, or `gmcl_regex_win32.dll` if you're using it clientside on Windows, etc.)
3. Navigate to your server's root directory (where srcds.exe, garrysmod, bin, etc. are)
4. Create a new folder inside `garrysmod/lua/` called `bin` if it doesn't already exist.
5. Place the renamed module (dll) into that folder.
6. Use the module in any Lua script by calling `require("regex")`.

### Usage
Here is a basic example on how to use this module:
```lua
require("regex")
local message = "viral32111<76561198168833275,STEAM_0:1:104283773> said \"Hello World!\""
local regularExpression="^(.+)<(\\d{17}),(STEAM_\\d:\\d:\\d+)> said \"(.*)\"$"
local matches = regex.match(message,regularExpression)
PrintTable(matches)
```

The output of this would be:
```
0       =       viral32111<76561198168833275,STEAM_0:1:104283773> said "Hello World!"
1       =       viral32111
2       =       76561198168833275
3       =       STEAM_0:1:104283773
4       =       Hello World!
```

(For more examples, check the [examples folder](examples))

### Generating a project
Run `build.bat` to generate a Visual Studio 2019 for Windows using the supplied premake5 configuration. This will create a new folder called `project` which will contain the Visual Studio project/solution files.

### Building *(Visual Studio 2019)*
Once you've made your changes to the source code, press CTRL+B (or Build > Build gm_steam). This will generate the .dll file inside a `build` folder.

###### [Copyright 2019 viral32111](LICENSE.md)
