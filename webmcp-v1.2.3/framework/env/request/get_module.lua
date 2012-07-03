--[[--
module_name =
request.get_module()

Returns the name of the module of the currently requested view or action.

--]]--

function request.get_module()
  if request._forward_processed then
    return request._forward.module or cgi.params._webmcp_module or 'index'
  else
    return cgi.params._webmcp_module or 'index'
  end
end
