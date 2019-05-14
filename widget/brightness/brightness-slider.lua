local wibox = require('wibox')
local mat_list_item = require('widget.material.list-item')
local mat_slider = require('widget.material.slider')
local mat_icon_button = require('widget.material.icon-button')
local clickable_container = require('widget.material.clickable-container')
local icons = require('theme.icons')
local watch = require('awful.widget.watch')
local spawn = require('awful.spawn')

local slider =
  wibox.widget {
  read_only = false,
  widget = mat_slider
}

slider:connect_signal(
  'property::value',
  function()
    spawn('xbacklight -set ' .. math.max(slider.value, 5))
  end
)

local icon =
  wibox.widget {
  image = icons.mdi_brightness_6,
  widget = wibox.widget.imagebox
}

local seticon = function(brightness)
  if brightness < 33 then
    icon.image = icons.mdi_brightness_5
  elseif brightness < 66 then
    icon.image = icons.mdi_brightness_6
  else
    icon.image = icons.mdi_brightness_7
  end
  return
end

watch(
  [[bash -c "xbacklight -get"]],
  1,
  function(widget, stdout, stderr, exitreason, exitcode)
    local brightness = string.match(stdout, '(%d+)')
    slider:set_value(tonumber(brightness))
    seticon(tonumber(brightness))
    collectgarbage('collect')
  end
)

local button = mat_icon_button(icon)

local brightness_setting =
  wibox.widget {
  button,
  slider,
  widget = mat_list_item
}

return brightness_setting
