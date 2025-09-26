-- This file contains code to completely disable clipboard integration
-- if you want to avoid permission prompts entirely.
-- You can include this in polish.lua if needed.

-- Disable clipboard provider
vim.g.loaded_clipboard_provider = 1

-- Unset clipboard option
vim.opt.clipboard = ""

-- Provide explicit mappings for copy/paste using the direct approach
local function setup_direct_only()
  vim.keymap.set({'n', 'v'}, '<leader>y', require('direct_clipboard').copy_to_clipboard, 
    { noremap = true, desc = "Copy to clipboard (direct)" })
  vim.keymap.set({'n', 'i'}, '<leader>p', require('direct_clipboard').paste_from_clipboard, 
    { noremap = true, desc = "Paste from clipboard (direct)" })
end

return {
  disable_clipboard = function()
    vim.g.loaded_clipboard_provider = 1
    vim.opt.clipboard = ""
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = setup_direct_only,
      once = true,
    })
  end
}
