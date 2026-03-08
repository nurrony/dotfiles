local wezterm = require 'wezterm'

local M = {}

-- Constructor function to initialize with a custom path
function M.setup(options)
  local self = {}
  self.cred_file_path = options.path or (wezterm.config_dir .. "/creds.json")

  -- Internal helper to load data
  local function load_data()
    local f = io.open(self.cred_file_path, "r")
    if not f then
      wezterm.log_error("passrelay: Could not open JSON at " .. self.cred_file_path)
      return {}
    end
    local content = f:read("*all")
    f:close()
    return wezterm.json_parse(content) or {}
  end

  -- The methods passrelay will call
  self.get_userlist = function()
    local data = load_data()
    local users = {}
    for username, _ in pairs(data) do
      table.insert(users, username)
    end
    table.sort(users)
    return users
  end

  self.get_password = function(user)
    local data = load_data()
    return data[user]
  end

  return self
end

return M
