vim.pack.add({ "https://codeberg.org/cryptomilk/nvim-pack-ui" })

vim.keymap.set("n", "<leader>p", function()
  vim.cmd("Pack")
end, { desc = "Pack" } )
