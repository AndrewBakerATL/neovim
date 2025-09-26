-- Alternative 1: Force OSC52 clipboard (works in most terminals)
local alternative1 = function()
  vim.g.clipboard = 'osc52'
  vim.opt.clipboard = "unnamedplus"
end

-- Alternative 2: Direct fork commands for clipboard
local alternative2 = function()
  vim.g.clipboard = {
    name = 'wl-direct',
    copy = {
      ['+'] = function()
        local filename = vim.fn.tempname()
        local f = io.open(filename, 'w')
        if f then
          f:write(vim.fn.getreg('"'))
          f:close()
          os.execute(string.format("cat %s | wl-copy", filename))
          os.remove(filename)
        end
      end,
      ['*'] = function()
        local filename = vim.fn.tempname()
        local f = io.open(filename, 'w')
        if f then
          f:write(vim.fn.getreg('"'))
          f:close()
          os.execute(string.format("cat %s | wl-copy --primary", filename))
          os.remove(filename)
        end
      end,
    },
    paste = {
      ['+'] = function()
        local filename = vim.fn.tempname()
        os.execute(string.format("wl-paste > %s", filename))
        local f = io.open(filename, 'r')
        if f then
          local data = f:read('*a')
          f:close()
          os.remove(filename)
          return data
        end
        return ''
      end,
      ['*'] = function()
        local filename = vim.fn.tempname()
        os.execute(string.format("wl-paste --primary > %s", filename))
        local f = io.open(filename, 'r')
        if f then
          local data = f:read('*a')
          f:close()
          os.remove(filename)
          return data
        end
        return ''
      end,
    },
  }
  vim.opt.clipboard = "unnamedplus"
end

-- Alternative 3: Use xsel (you have this installed) as fallback
local alternative3 = function()
  vim.g.clipboard = {
    name = 'xsel-wayland',
    copy = {
      ['+'] = 'xsel --clipboard --input',
      ['*'] = 'xsel --primary --input',
    },
    paste = {
      ['+'] = 'xsel --clipboard --output',
      ['*'] = 'xsel --primary --output',
    },
    cache_enabled = false,
  }
  vim.opt.clipboard = "unnamedplus"
end

return {
  alternative1 = alternative1,
  alternative2 = alternative2,
  alternative3 = alternative3,
}
