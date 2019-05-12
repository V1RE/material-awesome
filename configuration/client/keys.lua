local awful = require('awful')
require('awful.autofocus')
local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey

local clientKeys =
  awful.util.table.join(
  awful.key(
    {modkey},
    'f',
    function(c)
      local offset = 0
      if c.screen == screen.primary then
        offsetx = 48
      end
      c.floating = not c.floating
      c.width = (mouse.screen.geometry["width"] - offset) * 0.8
      c.height = (mouse.screen.geometry["height"] - offset) * 0.8
      c.x = (mouse.screen.geometry["x"] + offset) + ((mouse.screen.geometry["width"] - offset) / 2) - (c.width / 2) + 24
      c.y = (mouse.screen.geometry["y"] + offset) + ((mouse.screen.geometry["height"] - offset) / 2) - (c.height / 2) + 24
      c:raise()
    end,
    {description = 'toggle floating', group = 'client'}
  ),
  awful.key(
    {modkey},
    'q',
    function(c)
      c:kill()
    end,
    {description = 'close', group = 'client'}
  )
)

return clientKeys
