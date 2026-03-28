return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      -- Add the emoji source to the list of completion sources
      table.insert(opts.sources, { name = "emoji" })
    end,
  },
}
