# IPQuery API for Lua

This is a binding of the IPQuery API for Lua users.

Disclaimer: I am not affiliated with the IPQuery project! I just noticed the absence of a Lua library and decided to create one. Therefore, I do not take any responsibility for the API's functionality, performance, or any issues related to it, except in cases where the issue is caused by this Lua script itself!

You can install it using LuaRocks: 

```sh
$ luarocks install ipapi-lua
```

The `query_ip` function has two paramters `ìp` and `format`, if provided, it returns a string instead of a table. Besides `text`, which only returns the IP itself, the available formarts are `xml`, `yaml` and `json`.

Example:

```lua
local query_ip  = require "ipapi".query_ip

local ip_info = query_ip("1.1.1.1")

if ip_info.location.country_code == "AU" then
    set_language("en_AU")
end
```

Run `test.lua` to view many more examples and a detailed output.

