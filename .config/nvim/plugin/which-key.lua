vim.pack.add({ "https://github.com/folke/which-key.nvim" })

require("which-key").setup({
  preset = "helix",
  triggers = {
    { "<auto>", mode = "nixsotc" },
    -- { "<leader>", mode = { "n", "v" } },
  },
})

require("which-key").add({
  { "<leader>f", group = "find" },
})

-- vim.keymap.set("n", "<leader>?", function()
--   require("which-key").show({ global = true })
-- end, { desc = "Buffer Local Keymaps" } )

-- vim.keymap.set("n", "<leader>", function()
--   require("which-key").show()
-- end, { desc = "Show keymaps for leader" } )
