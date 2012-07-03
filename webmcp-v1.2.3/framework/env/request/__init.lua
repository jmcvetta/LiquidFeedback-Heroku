request._status = nil
request._forward = nil
request._forward_processed = false
request._redirect = nil
request._absolute_baseurl = nil
request._404_route = nil
request._force_absolute_baseurl = false
request._perm_params = {}
request._csrf_secret = nil
request._json_requests_allowed = false

local depth
if cgi then  -- if-clause to support interactive mode
  depth = tonumber(cgi.params._webmcp_urldepth)
end
if depth and depth > 0 then
  local elements = {}
  for i = 1, depth do
    elements[#elements+1] = "../"
  end
  request._relative_baseurl = table.concat(elements)
else
  request._relative_baseurl = "./"
end

request._app_basepath = assert(
  os.getenv("WEBMCP_APP_BASEPATH"),
  'WEBMCP_APP_BASEPATH is not set.'
)
if not string.find(request._app_basepath, "/$") then
  request._app_basebase = request._app_basepath .. "/"
end
