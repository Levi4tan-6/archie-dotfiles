return {
  -- configure 'trouble.nvim'
  {
    "folke/trouble.nvim",
    opts = {
      -- `use_diagnostic_signs` is deprecated in trouble.nvim v3
    },
  },
  -- note: we use a function for 'opts' to extend the default
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          return "󰋔"
        end,
      })
    end,
  },
}
