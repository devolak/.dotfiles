return {
  "norcalli/nvim-colorizer.lua",
  opts = { css = true, },
  config = function()
    require 'colorizer'.setup {
      '*'; -- Highlight all files, but customize some others.
      filetype = {
        "hyprlang",
      },
    }
  end,
}
