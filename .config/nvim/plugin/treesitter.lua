vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

local languages = {
  "vim",
  "vimdoc",
  "lua",
  "bash",
  "c",
  "cpp",
  "html",
  "css",
  "hyprlang",
  "qmljs",
  "latex",
}

-- require("nvim-treesitter").setup()
require("nvim-treesitter").install(languages)

vim.api.nvim_create_autocmd("FileType", {
  pattern = languages,
  callback = function()
    -- Enable native Neovim treesitter highlighting
    vim.treesitter.start()

    -- Configure code folding
    -- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    -- vim.wo.foldmethod = "expr"
    -- vim.wo.foldlevel = 99

    -- Enable treesitter-based indentation
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

vim.api.nvim_create_autocmd("PackChanged", {
  desc = "Handle nvim-treesitter updates",
  group = vim.api.nvim_create_augroup("nvim-treesitter-pack-changed-update-handler", { clear = true }),
  callback = function(event)
    if event.data.kind == "update" and event.data.spec.name == "nvim-treesitter" then
      vim.notify("nvim-treesitter updated, running TSUpdate...", vim.log.levels.INFO)
      ---@diagnostic disable-next-line: param-type-mismatch
      local ok = pcall(vim.cmd, "TSUpdate")
      if ok then
        vim.notify("TSUpdate completed successfully!", vim.log.levels.INFO)
      else
        vim.notify("TSUpdate command not available yet, skipping", vim.log.levels.WARN)
      end
    end
  end,
})
