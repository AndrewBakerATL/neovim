return {
  "DanilaMihailov/beacon.nvim",
  event = "VeryLazy",
  config = function()
    vim.g.beacon_size = 40
    vim.g.beacon_fade = 1
    vim.g.beacon_minimal_jump = 10
    vim.g.beacon_show_jumps = 1
    vim.g.beacon_ignore_filetypes = {
      'neo-tree',
      'alpha',
      'dashboard',
      'lazy',
      'mason',
      'notify',
      'toggleterm',
      'trouble',
    }
  end
}