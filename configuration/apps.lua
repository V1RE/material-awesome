local filesystem = require('gears.filesystem')

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'terminator',
    editor = 'code',
    rofi = 'rofi -modi combi -show combi -combi-modi window,drun,run -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi',
    lock = 'betterlockscreen -l dimblur',
    quake = 'alacritty --title QuakeTerminal'
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'monitorfix',
    'xmousepasteblock',
    'indicator-kdeconnect',
    'nitrogen --restore',
    'compton --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf',
    'blueberry-tray', -- Bluetooth tray icon
    'xfce4-power-manager', -- Power manager
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)' -- credential manager
  }
}