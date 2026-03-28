return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 20,
      open_mapping = [[<c-\>]], -- Ctrl + \ para abrir/cerrar terminal general
      hide_numbers = true,
      shade_terminals = true,
      direction = "float",
      float_opts = {
        border = "curved",
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      local Terminal = require("toggleterm.terminal").Terminal

      -- 1. Monitor Serie (Cerrar con 'q' o Ctrl+C dentro de la term)
      local esp_monitor = Terminal:new({
        cmd = "pio device monitor",
        hidden = true,
        direction = "float",
        on_open = function(term)
          vim.api.nvim_buf_set_keymap(term.bufnr, "t", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
      })

      -- 3. Mapeos Profesionales (Líder es Espacio)
      local map = vim.keymap.set
      -- We depend on the default 'pio' commands or we can just pass the string to OverseerRun directly
      -- Overseer will convert these to shell commands
      map("n", "<leader>cb", "<cmd>OverseerRunCmd pio run<CR>", { desc = "ESP32: Build Project" })
      map("n", "<leader>cu", "<cmd>OverseerRunCmd pio run -t upload<CR>", { desc = "ESP32: Upload Firmware" })
      map("n", "<leader>cm", "<cmd>lua _G.esp_monitor_toggle()<CR>", { desc = "ESP32: Serial Monitor" })
    end,
  },
}
