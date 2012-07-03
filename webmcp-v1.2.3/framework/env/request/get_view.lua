--[[--
view_name =
request.get_view()

Returns the name of the currently requested view, or nil in case of an action.

--]]--

function request.get_view()
  if request._forward_processed then
    return request._forward.view or 'index'
  else
    if cgi.params._webmcp_view then
      local suffix = cgi.params._webmcp_suffix or "html"
      if suffix == "html" then
        return cgi.params._webmcp_view
      else
        return cgi.params._webmcp_view .. "." .. suffix
      end
    elseif not cgi.params._webmcp_action then
      return 'index'
    else
      return nil
    end
  end
end
