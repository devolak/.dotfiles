vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

require("mason").setup()

vim.keymap.set("n", "<leader>M", function()
  vim.cmd("Mason")
end, { desc = "Mason" })

require("mason-tool-installer").setup({
  ensure_installed = {
    "lua_ls",
    "bashls",
    "clangd",
    "html",
    "cssls",
  },
})

require("mason-lspconfig").setup()
vim.lsp.enable({})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
