-- Reliable direct clipboard implementation using xsel
local M = {}

-- Function to copy text to system clipboard
function M.copy_to_clipboard()
  -- Check if in visual mode
  local mode = vim.api.nvim_get_mode().mode
  if mode:sub(1,1) == 'v' or mode == 'V' or mode == '' then
    -- Visual mode: yank selection to unnamed register first
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<esc>', true, false, true), 'nx', false)
    vim.api.nvim_feedkeys('gvy', 'nx', true)
  end
  
  -- Get content from the unnamed register
  local content = vim.fn.getreg('"')
  
  -- For small content, use direct piping
  if #content < 1024 then
    -- Simple version for small content
    local cmd = "printf '%s' " .. vim.fn.shellescape(content) .. " | xsel -i -b"
    vim.fn.system(cmd)
  else
    -- For larger content, use a temp file
    local tmpfile = vim.fn.tempname()
    local f = io.open(tmpfile, 'w')
    if not f then return false end
    f:write(content)
    f:close()
    
    vim.fn.system("cat " .. tmpfile .. " | xsel -i -b")
    os.remove(tmpfile)
  end
  
  vim.notify("Text copied to clipboard (xsel)", vim.log.levels.INFO)
  return true
end

-- Function to paste from system clipboard
function M.paste_from_clipboard()
  -- Use xsel directly
  local output = vim.fn.system("xsel -o -b")
  
  if output and #output > 0 then
    -- Remove trailing newline if present
    if output:sub(-1) == "\n" then
      output = output:sub(1, -2)
    end
    
    -- Set to register and paste
    vim.fn.setreg('"', output)
    vim.api.nvim_put({output}, 'c', false, true)
    return true
  end
  
  return false
end

-- Set up mappings
function M.setup()
  vim.keymap.set({'n', 'v'}, '<leader>y', M.copy_to_clipboard, { noremap = true, desc = "Copy to clipboard (xsel)" })
  vim.keymap.set({'n'}, '<leader>p', M.paste_from_clipboard, { noremap = true, desc = "Paste from clipboard (xsel)" })
end

return M
