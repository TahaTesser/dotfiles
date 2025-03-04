return {
    {
      "catppuccin/nvim",
      name = "catppuccino",
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        require("catppuccin").setup({
            flavour = "auto", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = "mocha",
            },
        })

        -- load the colorscheme here
        vim.cmd([[colorscheme catppuccin]])
      end,
    },
  }