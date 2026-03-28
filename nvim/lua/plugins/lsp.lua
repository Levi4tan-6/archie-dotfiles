return {
  -- configure Mason to ensure tools are installed
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },

  -- unified block for all lspconfig settings
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        -- We no longer define tsserver here; instead we use LazyVim's vtsls extra via lazy.lua
      },
      -- If any native lsp keymaps are needed for all servers, add them here
    },
  },
}
