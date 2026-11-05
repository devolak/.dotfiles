vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  animate = { enabled = true },
  bigfile = { enabled = true },
  dashboard = {
    enabled = true,
    preset = {
      keys = {
        { key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
        { key = "n", desc = "New File", action = ":ene | startinsert" },
        { key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
        { key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
        { key = "s", desc = "Restore Session", section = "session" },
        { key = "P", desc = "Pack", action = ":Pack" },
        { key = "q", desc = "Quit", action = ":qa" },
      },
      header = [[
█▄░█ █░█ █ █▀▄▀█
█░▀█ ▀▄▀ █ █░▀░█]],
    },
    sections = {
      { section = "header"},
      { section = "keys", gap = 1, padding = 1},
    },
  },
  explorer = { enabled = true },
  git = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  picker = { enabled = true },
  profiler = { enabled = true },
  notifier = { enabled = true, },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
})

-- Top Pickers & Explorer
vim.keymap.set("n", "<leader><space>", function()
  Snacks.picker.smart()
end, { desc = "Smart Find Files" })

vim.keymap.set("n", "<leader>,", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>/", function()
  Snacks.picker.grep()
end, { desc = "Grep" })

vim.keymap.set("n", "<leader>:", function()
  Snacks.picker.command_history()
end, { desc = "Command History" })

vim.keymap.set("n", "<leader>n", function()
  Snacks.picker.notifications()
end, { desc = "Notification History" })

vim.keymap.set("n", "<leader>e", function()
  Snacks.explorer()
end, { desc = "File Explorer" })

-- find
vim.keymap.set("n", "<leader>fc", function()
  Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File" })

vim.keymap.set("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>fr", function()
  Snacks.picker.recent()
end, { desc = "Recent" })

-- git
vim.keymap.set("n", "<leader>gb", function()
  Snacks.picker.git_branches()
end, { desc = "Git Branches" })

vim.keymap.set("n", "<leader>gl", function()
  Snacks.picker.git_log()
end, { desc = "Git Log" })

vim.keymap.set("n", "<leader>gL", function()
  Snacks.picker.git_log_line()
end, { desc = "Git Log Line" })

vim.keymap.set("n", "<leader>gs", function()
  Snacks.picker.git_status()
end, { desc = "Git Status" })

vim.keymap.set("n", "<leader>gS", function()
  Snacks.picker.git_stash()
end, { desc = "Git Stash" })

vim.keymap.set("n", "<leader>gd", function()
  Snacks.picker.git_diff()
end, { desc = "Git Diff (Hunks)" })

vim.keymap.set("n", "<leader>gf", function()
  Snacks.picker.git_log_file()
end, { desc = "Git Log File" })

-- grep
vim.keymap.set("n", "<leader>sb", function()
  Snacks.picker.lines()
end, { desc = "Buffer lines" })

vim.keymap.set("n", "<leader>sB", function()
  Snacks.picker.grep_buffers()
end, { desc = "Grep Open Buffers" })

vim.keymap.set("n", "<leader>sg", function()
  Snacks.picker.grep()
end, { desc = "Grep" })

vim.keymap.set({ "n", "x" }, "<leader>sw", function()
  Snacks.picker.grep_word()
end, { desc = "Visual selection or word" })

-- search
vim.keymap.set("n", "<leader>s/", function()
  Snacks.picker.search_history()
end, { desc = "Search History" })

vim.keymap.set("n", "<leader>sh", function()
  Snacks.picker.help()
end, { desc = "Help Pages" })

vim.keymap.set("n", "<leader>sM", function()
  Snacks.picker.man()
end, { desc = "Man Pages" })
