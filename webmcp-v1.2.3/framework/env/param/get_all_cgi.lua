--[[--
params =         -- table with all non-list parameters
param.get_all_cgi()

This function returns a table with all non-list GET/POST parameters (except internal parameters like "_webmcp_id").

--]]--

function param.get_all_cgi()
  local result = {}
  for key, value in pairs(cgi.params) do  -- TODO: exchanged params too?
    if
      (not string.match(key, "^_webmcp_")) and
      (not string.match(key, "%[%]$"))
    then
      result[key] = value
    end
  end
  return result
end
