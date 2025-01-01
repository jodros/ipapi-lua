# IPQuery API for Lua

This is a binding of the IPQuery API for Lua users.

Disclaimer: I am not affiliated with the IPQuery project! I just noticed the absence of a Lua library and decided to create one. Therefore, I do not take any responsibility for the API's functionality, performance, or any issues related to it, except in cases where the issue is caused by this Lua script itself!

Example:

```lua
local query_ip  = require "ipapi".query_ip
local get_own_ip = require "ipapi".get_own_ip

print(get_own_ip().ip)
local ip_info = query_ip("1.1.1.1")
local several_ips = query_ip({"1.1.1.1","2.2.2.2"})

if ip_info.location.country_code == "AU" then
    set_language("en_AU")
end
```

Run `test.lua` to view a detailed output.
