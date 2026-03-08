local credential_helper = require 'utils.credential_helper'

local credentials = credential_helper.setup {
  path = '/Volumes/Devzone/storage/wezterm/credentials.json'
}

return {
  get_userlist = credentials.get_userlist,
  get_password = credentials.get_password,
  hotkey = {
    mods = 'CTRL | CMD',
    key  = 'f',
  },

  toast_time = 3000,
}
