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
  -- Configure Snacks.notifier for a premium "Noctalia-like" look
  {
    "folke/snacks.nvim",
    opts = {
      notifier = {
        enabled = true,
        timeout = 3000,
        width = { min = 40, max = 0.4 },
        -- Style compact is very clean, similar to Material You toasts
        style = "compact", 
        top_down = false, -- Appear at the bottom right like most modern OS toasts
      },
      indent = { enabled = true },
      winbar = { enabled = true },
    },
  },
}
