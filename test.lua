local query_ip  = require "ipapi".query_ip
local get_own_ip = require "ipapi".get_own_ip
local inspect = require "inspect"

print(query_ip()) -- this just returns your IP
print(inspect(get_own_ip())) -- whereas this one returns it with all the info
print(inspect(query_ip("1.1.1.1")))
print(inspect(query_ip({"2.2.2.2", "3.3.3.3"}))) -- you can query several IPs at once

print(query_ip({"2.2.2.2", "3.3.3.3"}, "xml"))

print(query_ip("8.8.8.8", "yaml"))
print(query_ip("8.8.8.8", "xml"))
print(query_ip("8.8.8.8", "json"))
print(query_ip("8.8.8.8", "text"))

-- some error cases 
print(query_ip("8.8.8.8", "anyotherformat"))
query_ip("no ip")
query_ip(546456)
query_ip(true)

print(inspect(query_ip({"4.4.4.4", "no ip", "5.5.5.5"}))) -- in this case the "no ip" will simply be ignored and wont't throw any error
print(inspect(query_ip({"4.4.4.4", 3463, "5.5.5.5"}))) -- will warn that 3463 isn't an IP address, but it will keep running as well

