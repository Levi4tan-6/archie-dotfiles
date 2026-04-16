return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = function()
      local noctalia = require("util.noctalia").get_palette()
      return {
        flavour = "mocha",
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.15,
        },
        color_overrides = {
          mocha = {
            base = noctalia.surface,
            mantle = noctalia.surface,
            crust = noctalia.surface,
            text = noctalia.on_surface,
            subtext1 = noctalia.on_surface,
            subtext0 = noctalia.on_surface,
            mauve = noctalia.primary,
            blue = noctalia.secondary,
            red = noctalia.error,
            surface0 = noctalia.outline,
          },
        },
        custom_highlights = function()
          return {
            -- Indent guides linked to surface variant and primary
            SnacksIndent = { fg = noctalia.outline_variant or noctalia.outline },
            SnacksIndentScope = { fg = noctalia.primary },
            -- Winbar (breadcrumbs) linked to on_surface and primary for icons
            SnacksWinbar = { fg = noctalia.on_surface_variant or noctalia.on_surface },
            SnacksWinbarFile = { fg = noctalia.on_surface, bold = true },
          }
        end,
      }
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
