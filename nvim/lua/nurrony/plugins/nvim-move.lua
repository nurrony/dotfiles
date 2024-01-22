return {
  "fedepujol/move.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local opts = { noremap = true, silent = true }
    -- Normal-mode commands
    -- Alt + j
    opts.desc = "Move line to down"
    vim.keymap.set("n", "∆", ":MoveLine(1)<CR>", opts)
    -- Alt + k
    opts.desc = "Move line to up"
    vim.keymap.set("n", "˚", ":MoveLine(-1)<CR>", opts)

    -- Alt + l
    opts.desc = "Move char left"
    vim.keymap.set("n", "˙", ":MoveHChar(-1)<CR>", opts)

    -- Alt + h
    opts.desc = "Move char right"
    vim.keymap.set("n", "¬", ":MoveHChar(1)<CR>", opts)

    opts.desc = "Move word right"
    vim.keymap.set("n", "<leader>wf", ":MoveWord(1)<CR>", opts)

    opts.desc = "Move word left"
    vim.keymap.set("n", "<leader>wb", ":MoveWord(-1)<CR>", opts)

    -- Visual-mode commands
    -- Alt + j
    opts.desc = "Move line to down"
    vim.keymap.set("v", "∆", ":MoveBlock(1)<CR>", opts)

    -- Alt + k
    opts.desc = "Move line to up"
    vim.keymap.set("v", "˚", ":MoveBlock(-1)<CR>", opts)

    -- Alt + h
    opts.desc = "Move char to left"
    vim.keymap.set("v", "˙", ":MoveHBlock(-1)<CR>", opts)

    -- Alt + l
    opts.desc = "Move line to right"
    vim.keymap.set("v", "¬", ":MoveHBlock(1)<CR>", opts)
  end,
}
