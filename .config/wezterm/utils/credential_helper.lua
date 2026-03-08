local wezterm = require "wezterm"

local M = {}

local DEFAULT_FILE = "creds.json"

wezterm.log_info("Credential file env: " .. tostring(os.getenv("WEZTERM_PASSRELAY_CRED_FILE")))

function M.setup(opts)
  opts = opts or {}

  local self = {}
  self.cred_file_path = opts.path or (wezterm.config_dir .. "/" .. DEFAULT_FILE)

  -- Validation
  local function validate_schema(data)
    if type(data) ~= "table" then
      error("credential file must contain a JSON object")
    end

    for account, creds in pairs(data) do
      if type(account) ~= "string" then
        error("account name must be string")
      end

      if type(creds) ~= "table" then
        error("account '" .. account .. "' must contain object of username/password")
      end

      for username, password in pairs(creds) do
        if type(username) ~= "string" then
          error("username must be string under account '" .. account .. "'")
        end

        if type(password) ~= "string" then
          error("password must be string for " .. account .. "/" .. username)
        end
      end
    end
  end

  -- Load credentials
  local function load_data()
    local f = io.open(self.cred_file_path, "r")
    if not f then
      wezterm.log_error("passrelay: cannot open credential file " .. self.cred_file_path)
      return {}
    end

    local content = f:read("*all")
    f:close()

    local ok, parsed = pcall(wezterm.json_parse, content)
    if not ok then
      wezterm.log_error("passrelay: invalid JSON in credential file")
      return {}
    end

    local valid, err = pcall(validate_schema, parsed)
    if not valid then
      wezterm.log_error("passrelay: schema validation failed: " .. err)
      return {}
    end

    return parsed
  end


  -- Build user list
  self.get_userlist = function()
    local data = load_data()
    local users = {}

    for account, creds in pairs(data) do
      for username, _ in pairs(creds) do
        table.insert(users, account .. "/" .. username)
      end
    end

    table.sort(users)
    return users
  end


  -- Password lookup
  self.get_password = function(user)
    if type(user) ~= "string" then
      return nil
    end

    local account, username = user:match("^([^/]+)/(.+)$")

    if not account then
      wezterm.log_error("passrelay: invalid user format: " .. tostring(user))
      return nil
    end

    local data = load_data()

    if data[account] and data[account][username] then
      return data[account][username]
    end

    return nil
  end

  return self
end

return M
