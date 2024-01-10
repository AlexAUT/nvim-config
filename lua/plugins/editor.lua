return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {},
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
  { 'numToStr/Comment.nvim', opts = {} },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'vimdoc', 'cmake', 'markdown', 'markdown_inline' },
        sync_install = false,
        indent = {
          enable = false,
        },
        highlight = {
          enable = true,
          -- disable slow treesitter highlight for large files
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },
  {
    'echasnovski/mini.trailspace',
    opts = {}
  },
}
