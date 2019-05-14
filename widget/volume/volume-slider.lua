local wibox = require('wibox')
local mat_list_item = require('widget.material.list-item')
local mat_slider = require('widget.material.slider')
local mat_icon_button = require('widget.material.icon-button')
local icons = require('theme.icons')
local watch = require('awful.widget.watch')
local spawn = require('awful.spawn')
local config = require('config')
local awful = require('awful')

local slider =
  wibox.widget {
  read_only = false,
  widget = mat_slider
}

slider:connect_signal(
  'property::value',
  function()
    spawn('amixer -D pulse sset Master ' .. slider.value .. '%')
  end
)

local icon =
  wibox.widget {
  image = icons.mdi_volume_medium,
  widget = wibox.widget.imagebox
}

local seticon = function(volume, status)
  if status == "off" then
    icon.image = icons.mdi_volume_off
  elseif volume < 33 then
    icon.image = icons.mdi_volume_low
  elseif volume < 66 then
    icon.image = icons.mdi_volume_medium
  else
    icon.image = icons.mdi_volume_high
  end
  return
end

watch(
  [[bash -c "amixer -D pulse sget Master"]],
  1,
  function(_, stdout)
    local status = string.match(stdout, '%[(o%D%D?)%]')
    local volume = string.match(stdout, '(%d?%d?%d)%%')
    slider:set_value(tonumber(volume))
    seticon(tonumber(volume), status)
    collectgarbage('collect')
  end
)

local button = mat_icon_button(icon)

button:buttons(
  awful.util.table.join(
    awful.button(
      {},
      1,
      function()
        awful.spawn(config.apps.volume)
        _G.screen.primary.left_panel:toggle(false)
      end
    )
  )
)

local volume_setting =
  wibox.widget {
  button,
  slider,
  widget = mat_list_item
}

return volume_setting
