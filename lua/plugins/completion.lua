return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      {
        'onsails/lspkind.nvim',
        -- config = function ()
        --   require'lspkind'.init{}
        -- end,
      },
      'p00f/clangd_extensions.nvim',
      'lukas-reineke/cmp-under-comparator',

    },
    config = function()
      local cmp = require 'cmp'
      local lspkind = require 'lspkind'
      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<C-e>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            local ls = require 'luasnip'
            if ls.expand_or_locally_jumpable() then
              ls.jump(1)
            else
              fallback()
            end
          end),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            local ls = require 'luasnip'
            if ls.expand_or_locally_jumpable() then
              ls.jump(-1)
            else
              fallback()
            end
          end),
        },
        formatting = {
          format = lspkind.cmp_format({
            preset = 'codicons'
          }),
        },
        sorting = {
          comparators = {
            cmp.config.compare.exact,
            cmp.config.compare.length,
            cmp.config.compare.offset,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
          },
        },
        -- sources = cmp.config.sources(
        --   {
        --     { name = 'nvim_lsp' },
        --     { name = 'luasnip' },
        --   },
        --   {
        --     { name = 'path' },
        --     { name = 'buffer' },
        --   }
        -- ),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },
}
