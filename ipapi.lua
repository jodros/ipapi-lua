local request = require "ssl.https".request
local cjson = require "cjson"

local api = "https://api.ipquery.io/"

local not_string = function(ip)
  print ("Error: " .. tostring(ip) .. " is not an IP adress...")
end

local run_over_ip_list = function(list) -- table.concat wouldn't be enough for this case, run test.lua in the `concat` branch to see it
  local str = ""
  for _, ip in ipairs(list) do
    if type(ip) == "string" then
      str = str .. ip .. ","
    else
      not_string(ip)
    end
  end
  return str
end

local query_ip = function(ip, format)
  ip = ip or ""

  if type(ip) == "table" then
    ip = run_over_ip_list(ip)
  elseif type(ip) ~= "string" then
    not_string(ip)
    return fals
  end

  if format then
    local f_check = false
    for _, f in ipairs({"yaml", "json", "xml", "text"}) do
      if f == format then f_check = true end
    end
    if not f_check then
      print(tostring(format) .. " is not a supported format")
      return false
    end
  end
 
  local url = format and api..ip.."?format="..format or api..ip
  local ip_info, http_code, _, status = request(url)

  if http_code == 200 then
    ip_info = (format or ip == "") and ip_info or cjson.decode(ip_info)
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

