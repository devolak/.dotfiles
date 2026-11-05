vim.pack.add({ "https://codeberg.org/cryptomilk/nvim-pack-ui" })

vim.keymap.set("n", "<leader>P", function()
  vim.cmd("Pack")
end, { desc = "Pack" } )
