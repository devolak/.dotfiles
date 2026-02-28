return {
  "catgoose/nvim-colorizer.lua",
  opts = {
    options = {
      parsers = {
        css = true,
        css_fn = true,
        hex = {
          enabled = true,
          rgb = true,
          rgba = true,
          rrggbb = true,
          rrggbbaa = true,
          aarrggbb = true,
        },
        rgb = { enabled = true },
        hsl = { enabled = true },
        oklch = { enabled = true },
        -- tailwind = {
        --   enabled = true,
        --   lsp = true,
        --   update_names = true,
        -- },
        sass = {
          enabled = true,
          parsers = { css = true },
          variable_pattern = "^%$([%w_-]+)",
        },
      },
      display = {
        mode = "background",
        background = {
          bright_fg = "#000000",
          dark_fg = "#ffffff",
        },
        virtualtext = {
          char = "■",
          position = "eol", -- "eol"|"before"|"after"
          hl_mode = "foreground",
        },
      },
    },
  },
}
