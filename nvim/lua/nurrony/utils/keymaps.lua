-- vim modes
local vim_modes = {
  n = 'n', -- normal
  i = 'i', -- insert
  v = 'v', -- visual
}

-- default options for keymaps
local default_opts = {
  noremap = true,
  silent = true,
}

--- get all options
--- @param opts (table|nil)
--- @return table
local get_opts = function(opts)
  local all_opts = opts
  if all_opts == nil then
    all_opts = {}
  end
  for k, v in pairs(default_opts) do
    all_opts[k] = all_opts[k] or v
  end
  return all_opts
end
