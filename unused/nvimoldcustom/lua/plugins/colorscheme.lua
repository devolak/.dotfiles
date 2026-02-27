return {
  {
    "rebelot/kanagawa.nvim",
    enabled = true,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("kanagawa-wave")
    end,
  },
  {
    "sainnhe/gruvbox-material",
    enabled = false,
    priority = 1000,
    config = function()
      -- vim.opt.background = "dark" -- or "light" for light mode
      -- vim.cmd.colorscheme("gruvbox")
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_foreground = "material"
      vim.cmd.colorscheme("gruvbox-material")
    end,
  }
}
