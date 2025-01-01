local request = require "ssl.https".request
local cjson = require "cjson"

local api = "https://api.ipquery.io/"

local not_string = function(ip)
  print ("Error: " .. tostring(ip) .. " is not an IP adress...")
  return false 
end

local run_over_ip_list = function(list)
  local str = ""
  for _, ip in ipairs(list) do
    if type(ip) == "string" then
      str = str .. ip .. ","
    else
      return not_string(ip)
    end
  end
  return str
end

local query_ip = function(ip)
  ip = ip or ""

  if type(ip) == "table" then
    ip = run_over_ip_list(ip)
    if not ip then return false end -- ensure it is not going to run when the input isn't a string!
  elseif type(ip) ~= "string" then 
    return not_string(ip)
  end
  
  local ip_info, http_code, _, status = request(api..ip)

  if http_code == 200 then
    ip_info = (ip == "") and ip_info or cjson.decode(ip_info)
  else
    print(ip_info)
    print(status)
    return false
  end
        
  return ip_info
end

local get_own_ip = function ()
  local own_ip = query_ip() -- If you leave the parameter unspecified, it will return your own IP. 
  return query_ip(own_ip)
end

return { 
  query_ip = query_ip,
  get_own_ip = get_own_ip
}
