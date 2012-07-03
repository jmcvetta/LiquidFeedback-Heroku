-- web.lua
require "xavante"
require "xavante.filehandler"

port = ...

xavante.HTTP {
  server = { host = "*", port = tonumber(port) },
  defaultHost = {
    rules = {
      {
        match = "/$",
        with = function(req, res)
          res.headers["Content-type"] = "text/html"
          res.content = "hello world, the time is: " .. os.date()
          return res
        end
      }, {
        match = ".",
        with = xavante.filehandler,
        params = { baseDir = "static/" }
      }
    }
  }
}

xavante.start()

