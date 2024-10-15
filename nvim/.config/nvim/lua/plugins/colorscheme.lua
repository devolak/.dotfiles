return {
  -- add gruvbox
  { "catppuccin/nvim",         name = "catppuccin", piority = 1000 },
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  }
}
