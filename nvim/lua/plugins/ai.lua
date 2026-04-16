return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Set this to "*" to always pull the latest release version, or false to update on release
    opts = {
      provider = "openrouter",
      auto_suggestions_provider = "openrouter", 
      providers = {
        openrouter = {
          __inherited_from = "openai",
          endpoint = "https://openrouter.ai/api/v1",
          api_key_name = "OPENROUTER_API_KEY",
          model = "qwen/qwen-2.5-72b-instruct", -- deepseek/deepseek-v3.2
          timeout = 30000,
          disable_tools = true,
          extra_request_body = {
            temperature = 0,
            max_tokens = 4096,
            tool_choice = "none", -- Previene que OpenRouter/DeepSeek intente ejecutar tools
            tools = {}, -- Vaciamos explícitamente la lista de herramientas por defecto
          },
        },
      },
      behaviour = {
        auto_suggestions = false, -- Experimental stage
      },
      file_selector = {
        provider = "snacks",
        provider_opts = {},
      },
      input = {
        provider = "snacks",
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
