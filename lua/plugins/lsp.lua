return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim',           opts = {} },
      { 'williamboman/mason-lspconfig.nvim', opts = {} },
      { 'j-hui/fidget.nvim',                 opts = {} },
      { 'folke/neodev.nvim',                 opts = { lspconfig = false } },
      'hrsh7th/cmp-nvim-lsp',
      'ray-x/lsp_signature.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      require("mason-lspconfig").setup_handlers {
        -- Default server setup
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            capabilities = lsp_capabilities,
          }
        end,
        -- Overrides
        ['lua_ls'] = function()
          require 'lspconfig'.lua_ls.setup {
            before_init = require 'neodev.lsp'.before_init,
            settings = {
              Lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
                -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                diagnostics = { disable = { 'missing-fields' } },
              },
            },
          }
        end,
        ["clangd"] = function()
          require 'lspconfig'.clangd.setup {
            capabilities = lsp_capabilities,
            cmd = { 'clangd', '-header-insertion=never' },
          }
        end,
      }


      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          require "lsp_signature".on_attach({}, ev.bufnr)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          local nmap = function(keys, func, desc)
            if desc then
              desc = 'LSP: ' .. desc
            end

            vim.keymap.set('n', keys, func, { buffer = ev.bufnr, desc = desc })
          end

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          nmap('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
          nmap('gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
          nmap('gi', vim.lsp.buf.implementation, '[g]oto [i]mplementation')
          nmap('K', vim.lsp.buf.hover, 'hover')
          nmap('<C-k>', vim.lsp.buf.signature_help, 'signature_help')
          nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[w]orkspace folder [a]dd')
          nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[w]orkspace folder [r]emove')
          nmap('<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, '[w]orkspace folders [l]ist')
          nmap('<leader>D', vim.lsp.buf.type_definition, 'type [D]efinition')
          nmap('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
          nmap('<leader>ca', vim.lsp.buf.code_action, '[c]ode [a]ction')
          nmap('gr', vim.lsp.buf.references, '[g]oto [r]eferences')
          nmap('<leader>f', function()
            vim.lsp.buf.format { async = true }
          end, '[f]ormat')

          nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
          nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client ~= nil then
            if client.name == 'clangd' then
              vim.keymap.set("n", "<A-o>", "<CMD>ClangdSwitchSourceHeader<CR>", { desc = "Switch Header/Source File" })
            end
          end
        end,
      })
    end,
  },
  {
    'tamago324/nlsp-settings.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
    },
    opts = {},
  }
}
