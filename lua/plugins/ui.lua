return {
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require 'neo-tree'.setup {
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
          use_libuv_file_watcher = true,
        }
      }
      vim.keymap.set("n", "<leader>e", [[<cmd>Neotree toggle<cr>]], { desc = "[N]eoTree [T]oggle" })
    end,
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      vim.keymap.set("n", "<leader>w", require "zen-mode".toggle)
    end,
  },
  {
    'RRethy/vim-illuminate',
    config = function()
      require 'illuminate'.configure {
        large_file_cutoff = 10000
      }
    end,
  },
}
