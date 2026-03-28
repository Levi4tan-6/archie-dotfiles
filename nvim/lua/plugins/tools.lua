return {
  {
    "stevearc/overseer.nvim",
    cmd = { "OverseerRun", "OverseerToggle", "OverseerInfo" },
    opts = {
      templates = { "builtin" },
    },
    keys = {
      { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run Task" },
      { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle Task List" },
      { "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "Overseer Info" },
    },
  },
}
