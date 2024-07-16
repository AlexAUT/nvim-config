return {
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'tokyonight'
  --   end,
  -- },
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'rose-pine-moon'
  --   end,
  -- },
  -- {
  --   'rebelot/kanagawa.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'kanagawa'
  --   end,
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    'folke/neoconf.nvim',
    opts = {}
  },
  {
    'NMAC427/guess-indent.nvim',
    opts = {}
  },
  {
    'folke/which-key.nvim',
    dependencies = {
      'echasnovski/mini.icons',
    },
    config = function()
      require('which-key').setup {}
      require('which-key').add {
        { "<leader>c",  group = "[C]ode" },
        { "<leader>d",  group = "[D]ocument" },
        { "<leader>d_", hidden = true },
        { "<leader>g",  group = "[G]it" },
        { "<leader>g_", hidden = true },
        { "<leader>h",  group = "Git[H]unk" },
        { "<leader>h_", hidden = true },
        { "<leader>r",  group = "[R]ename" },
        { "<leader>r_", hidden = true },
        { "<leader>s",  group = "[S]earch" },
        { "<leader>s_", hidden = true },
        { "<leader>t",  group = "[T]oggle" },
        { "<leader>t_", hidden = true },
        { "<leader>w",  group = "[W]orkspace" },
        { "<leader>w_", hidden = true },
      }
      require('which-key').add {
        { "<leader>",  group = "VISUAL <leader>", mode = "v" },
        { "<leader>h", desc = "Git [H]unk",       mode = "v" },
      }
    end,
  },
  {
    'echasnovski/mini.bracketed',
    opts = {},
  },
}
