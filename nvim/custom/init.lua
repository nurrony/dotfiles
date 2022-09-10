-- commands

-- replace string from file
local function sed(from, to, fname)
  vim.cmd(string.format("silent !sed -i 's/%s/%s/g' %s", from, to, fname))
end

require "custom.commands"
