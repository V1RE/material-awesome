local awful = require('awful')
local gears = require('gears')
local icons = require('theme.icons')
local apps = require('configuration.apps')
local config = require("config")

local tags = {
  {
    icon = icons.chrome,
    type = 'chrome',
    defaultApp = config.apps.browser,
    screen = 1
  },
  {
    icon = icons.code,
    type = 'code',
    defaultApp = config.apps.editor,
    screen = 1
  },
  {
    icon = icons.social,
    type = 'social',
    defaultApp = config.apps.social,
    screen = 1
  },
  {
    icon = icons.folder,
    type = 'files',
    defaultApp = config.apps.filemanager,
    screen = 1
  },
  {
    icon = icons.music,
    type = 'music',
    defaultApp = config.apps.music,
    screen = 1
  },
  {
    icon = icons.game,
    type = 'game',
    defaultApp = config.apps.games,
    screen = 1
  },
  {
    icon = icons.lab,
    type = 'any',
    defaultApp = apps.default.rofi,
    screen = 1
  }
}

awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.max
}

awful.screen.connect_for_each_screen(
  function(s)
    if s == screen.primary then
      for i, tag in pairs(tags) do
        awful.tag.add(
          i,
          {
            icon = tag.icon,
            icon_only = true,
            layout = awful.layout.suit.tile,
            gap_single_client = false,
            gap = 4,
            screen = s,
            defaultApp = tag.defaultApp,
            selected = i == 1
          }
        )
      end
    else
      awful.tag.add(
          0,
          {
            icon = icons.lab,
            icon_only = true,
            layout = awful.layout.suit.tile,
            gap_single_client = false,
            gap = 4,
            screen = s,
            defaultApp = apps.default.rofi,
            selected = true
          }
        )
    end
  end
)

_G.tag.connect_signal(
  'property::layout',
  function(t)
    local currentLayout = awful.tag.getproperty(t, 'layout')
    if (currentLayout == awful.layout.suit.max) then
      t.gap = 0
    else
      t.gap = 4
    end
  end
)
