local dir = os.getenv('HOME') .. '/.config/awesome/theme/icons'

return {
  --tags
  chrome = dir .. '/google-chrome.svg',
  code = dir .. '/code-braces.svg',
  social = dir .. '/forum.svg',
  folder = dir .. '/folder.svg',
  music = dir .. '/music.svg',
  game = dir .. '/google-controller.svg',
  lab = dir .. '/flask.svg',
  --others
  menu = dir .. '/menu.svg',
  close = dir .. '/close.svg',
  logout = dir .. '/logout.svg',
  sleep = dir .. '/power-sleep.svg',
  power = dir .. '/power.svg',
  lock = dir .. '/lock.svg',
  restart = dir .. '/restart.svg',
  search = dir .. '/magnify.svg',
  chart = dir .. '/chart-areaspline.svg',
  memory = dir .. '/memory.svg',
  harddisk = dir .. '/harddisk.svg',
  thermometer = dir .. '/thermometer.svg',
  plus = dir .. '/plus.svg',
  --extra
  menu_open = dir .. '/menu-open.svg',
  volume = {
    low = dir .. '/volume/volume-low.svg',
    medium = dir .. '/volume/volume-medium.svg',
    high = dir .. '/volume/volume-high.svg',
    off = dir .. '/volume/volume-off.svg'
  },
  brightness = {
    low = dir .. '/brightness/brightness-5.svg',
    medium = dir .. '/brightness/brightness-6.svg',
    high = dir .. '/brightness/brightness-7.svg'
  }
}
