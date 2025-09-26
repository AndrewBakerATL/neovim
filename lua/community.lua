-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.scrolling.mini-animate" },
  { import = "astrocommunity.indent.snacks-indent-hlchunk" },
  { import = "astrocommunity.editing-support.conform-nvim" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.utility.hover-nvim" },
  { import = "astrocommunity.pack.nginx" },
  { import = "astrocommunity.pack.biome" },
  { import = "astrocommunity.colorscheme.iceberg-vim" },
  { import = "astrocommunity.colorscheme.github-nvim-theme" },
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  { import = "astrocommunity.color.nvim-highlight-colors" },
  { import = "astrocommunity.colorscheme.citruszest-nvim" },
  { import = "astrocommunity.completion.avante-nvim" },
  { import = "astrocommunity.completion.blink-cmp" },
  { import = "astrocommunity.completion.blink-cmp-tmux" },
  { import = "astrocommunity.completion.blink-cmp-git" },
  { import = "astrocommunity.completion.blink-cmp-emoji" },
  { import = "astrocommunity.completion.cmp-spell" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.docker.lazydocker" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.motion.before-nvim" },
  { import = "astrocommunity.media.image-nvim" },
  -- { import = "astrocommunity.scrolling.mini-animate" },
  { import = "astrocommunity.scrolling.nvim-scrollbar" },
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  { import = "astrocommunity.editing-support.nvim-treesitter-context" },
  { import = "astrocommunity.editing-support.vim-doge" },
  { import = "astrocommunity.editing-support.yanky-nvim" },
  { import = "astrocommunity.git.fugit2-nvim" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.indent.snacks-indent-hlchunk" },
  { import = "astrocommunity.indent.mini-indentscope" },

  { import = "astrocommunity.motion.move-nvim" },
  -- import/override with your plugins folder
}
