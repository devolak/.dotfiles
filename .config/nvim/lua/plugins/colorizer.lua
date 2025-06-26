return {
  "catgoose/nvim-colorizer.lua",
  opts = {
    user_default_options = {
      names = false,
      RGB = true, -- #RGB hex codes
      RGBA = true, -- #RGBA hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      AARRGGBB = true, -- 0xAARRGGBB hex codes
      -- css = true, -- Enable all CSS *features*:
      -- names, RGB, RGBA, RRGGBB, RRGGBBAA, AARRGGBB, rgb_fn, hsl_fn
      css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    },
  },
}
