vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("telescope-fzf-build", { clear = true }),
  callback = function(ev)
    if ev.data.spec.name == "telescope-fzf-native.nvim"
      and (ev.data.kind == "install" or ev.data.kind == "update") then
      -- Synchronous build: vim.system is async and races load_extension
      -- during the same startup (and fails silently if make itself errors).
      local out = vim.fn.system({ "make", "-C", ev.data.path })
      if vim.v.shell_error ~= 0 then
        vim.notify("telescope-fzf-native build failed:\n" .. out, vim.log.levels.ERROR)
      end
    end
  end,
})

vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
})

require("telescope").load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "help tags" })
vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "fzf current buffer" })
