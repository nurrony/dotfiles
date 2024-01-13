-- import comment plugin safely
local installed, comment = pcall(require, "Comment")
if not installed then
  return
end

-- enable comment
comment.setup()
