local system_settings = require("system-params")
local ascii_headers = require("plugins.assets.ascii")

local user_settings = {
  dashboard_header = ascii_headers.header2,
  theme = system_settings.available_themes.nord,
  transparent_background = true,
}

return user_settings