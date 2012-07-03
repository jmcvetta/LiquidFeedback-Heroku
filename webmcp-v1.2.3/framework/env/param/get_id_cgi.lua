--[[--
value =             -- id string or nil
param.get_id_cgi()

This function returns the string value of the _webmcp_id GET/POST parameter.

--]]--

function param.get_id_cgi()
  return cgi.params._webmcp_id
end
