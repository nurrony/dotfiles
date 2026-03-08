local wezterm = require 'wezterm'

local M = {}

function M.setup(options)
  local self = {}
  self.cred_file_path = options.path or (wezterm.config_dir .. "/creds.json")

  -- Load JSON credentials
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

  -- Build list: account/username
  self.get_userlist = function()
    local data = load_data()
    local users = {}

    for account, creds in pairs(data) do
      if type(creds) == "table" then
        for username, _ in pairs(creds) do
          table.insert(users, account .. "/" .. username)
        end
      end
    end

    table.sort(users)
    return users
  end

  -- Resolve password
  self.get_password = function(user)
    local data = load_data()

    local account, username = user:match("^([^/]+)/(.+)$")
    if not account or not username then
      wezterm.log_error("passrelay: invalid user format " .. tostring(user))
      return nil
    end

    if data[account] and data[account][username] then
      return data[account][username]
    end

    return nil
  end

  return self
end

return M
