-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Configure clipboard to use xsel (which we've confirmed works)
vim.g.clipboard = {
  name = "xsel-clipboard",
  copy = {
    ["+"] = "xsel --clipboard --input",
    ["*"] = "xsel --primary --input",
  },
  paste = {
    ["+"] = "xsel --clipboard --output",
    ["*"] = "xsel --primary --output",
  },
  cache_enabled = false,
}

-- Enable system clipboard with unnamedplus
vim.opt.clipboard = "unnamedplus"

-- Fix possible buffer handling error
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if not vim.t.bufs then vim.t.bufs = {} end
  end,
})

-- Force clipboard provider reload
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Force clipboard provider reload
    if vim.g.loaded_clipboard_provider then
      vim.g.loaded_clipboard_provider = nil
      vim.cmd "runtime autoload/provider/clipboard.vim"
    end
  end,
  once = true,
})
