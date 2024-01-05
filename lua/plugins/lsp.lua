return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      {'williamboman/mason-lspconfig.nvim', opts = {} },
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local lspconfig = require('lspconfig')
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      require("mason-lspconfig").setup_handlers {
        -- Default server setup
        function (server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            capabilities = lsp_capabilities,
          }
        end,
        -- Overrides
        ["clangd"] = function ()
          require'lspconfig'.clangd.setup{
            capabilities = lsp_capabilities,
            cmd = { 'clangd', '-header-insertion=never' },
          }
        end
      }


      -- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      -- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      --
      -- nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
      -- nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      -- nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
      -- nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
      -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
      --
      -- -- See `:help K` for why this keymap
      -- nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
      --
      -- -- Lesser used LSP functionality
      -- nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
      -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
      -- nmap('<leader>wl', function()
      --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      -- end, '[W]orkspace [L]ist Folders')

      -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      --   vim.lsp.buf.format()
      -- end, { desc = 'Format current buffer with LSP' })
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
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
          nmap('<space>wa', vim.lsp.buf.add_workspace_folder, '[w]orkspace folder [a]dd')
          nmap('<space>wr', vim.lsp.buf.remove_workspace_folder, '[w]orkspace folder [r]emove')
          nmap('<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, '[w]orkspace folders [l]ist')
          nmap('<space>D', vim.lsp.buf.type_definition, 'type [D]efinition')
          nmap('<space>rn', vim.lsp.buf.rename, '[r]e[n]ame')
          nmap('<space>ca', vim.lsp.buf.code_action, '[c]ode [a]ction')
          nmap('gr', vim.lsp.buf.references, '[g]oto [r]eferences')
          nmap('<space>f', function()
            vim.lsp.buf.format { async = true }
          end, '[f]ormat')
        end,
      })
    end,
  },
}
